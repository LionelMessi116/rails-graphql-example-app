module GQL
  module Utils
    class EnsureHash
      def self.call(ambiguous_param)
        case ambiguous_param
          when String
            return {} if ambiguous_param.blank?

            call(JSON.parse(ambiguous_param))
          when Hash, ActionController::Parameters
            ambiguous_param
          when nil
            {}
          else
            raise UnexpectedVariables, "Unexpected parameter: #{ambiguous_param}"
        end
      end
    end
  end
end
