# frozen_string_literal: true

module BaseTypes
  class DefaultErrorType < BaseTypes::BaseObject

    not_nullable do
      field :type, String
      field :message, String
    end

    nullable do
      field :path, [String]
    end
  end
end
