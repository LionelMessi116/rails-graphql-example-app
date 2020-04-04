class GraphqlController < ActionController::API
  include ActionController::Cookies

  class UnexpectedVariables < ArgumentError; end

  def execute
    p 'current_user', current_user
    context = GQL::BuildUserContext.call(current_user, guest).merge(
      referer: request.referer,
    )

    result = if params[:_json]
               GQL::Schema.multiplex(
                   params[:_json].map { |param| build_query_params(param, context) }
               )
             else
               GraphQlSchema.execute(build_query_params(params, context))
             end

    render json: result
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  ensure
    BatchLoader::Executor.clear_current
  end

  private

  def build_query_params(params, context)
    {
      query: params[:query],
      operation_name: params[:operationName],
      variables: GQL::Utils::EnsureHash.call(params[:variables]&.to_unsafe_h&.to_h),
      context: context,
    }
  end

  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end

  def current_user
    JWTWrapper.extract_user_from_headers(request.headers)
  end

  def guest
    User.new
  end
end
