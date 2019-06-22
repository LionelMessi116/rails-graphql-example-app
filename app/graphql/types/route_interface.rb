# frozen_string_literal: true

module Types
  module RouteInterface
    include BaseTypes::BaseInterface

    not_nullable do
      field :id, ID
      field :type_object, TypeObjectEnum
    end

    def type_object
      raise 'Must be implemented'
    end
  end
end
