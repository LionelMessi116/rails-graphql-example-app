# frozen_string_literal: true

module Mutations
  class Base < GraphQL::Schema::Mutation
    include BaseTypes::Helpers

    field :ok, Boolean, null: false
    field :errors, [BaseTypes::DefaultErrorType], null: false
    field :route, Types::RouteInterface, null: true

    def resolve(**args)
      call(args).reverse_merge(ok: true, errors: [])
    rescue => err
      error = {
        type: err.class.name,
        message: err.message,
        path: err.backtrace,
      }

      { ok: false, errors: [error] }
    end
  end
end
