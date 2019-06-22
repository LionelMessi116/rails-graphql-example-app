# frozen_string_literal: true

module Types
  class ProductEdgeType < BaseTypes::RelayEdge
    node_type(ProductType)
  end
end
