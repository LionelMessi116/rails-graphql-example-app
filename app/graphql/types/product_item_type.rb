# frozen_string_literal: true

module Types
  class ProductItemType < BaseTypes::BaseObject

    implements RouteInterface

    non_nullable do
      field :color, String
      field :price, Integer
    end

    def type_object
      :product_item
    end
  end
end
