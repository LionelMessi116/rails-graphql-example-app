# frozen_string_literal: true

module Types
  class ProductItemConnectionType < BaseTypes::RelayConnection
    edge_type(ProductItemEdgeType)
  end
end
