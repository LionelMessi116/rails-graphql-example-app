# frozen_string_literal: true

module Types
  class ProductItemEdgeType < BaseTypes::RelayEdge
    node_type(ProductItemType)
  end
end
