# frozen_string_literal: true

module Types
  class UserType < BaseTypes::BaseObject

    implements RouteInterface

    nullable do
      field :name, String
    end
  end
end
