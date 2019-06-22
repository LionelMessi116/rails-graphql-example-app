# frozen_string_literal: true

module Types
  class ProductConnectionType < BaseTypes::RelayConnection
    edge_type(ProductEdgeType)
  end
end
