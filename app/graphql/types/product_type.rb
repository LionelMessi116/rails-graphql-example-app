# frozen_string_literal: true

module Types
  class ProductType < BaseTypes::BaseObject

    implements RouteInterface

    non_nullable do
      field :name, String
      field :product_items, ProductItemConnectionType
      field :batch_product_items, [ProductItemType]

      field :items_count, Integer, method: :items_count
    end

    def type_object
      :product
    end

    def items_count
      BatchLoader.for(object.id).batch(key: :product_items_count) do |product_ids, loader|
        scope = ProductItem.where(product_id: product_ids)

        h = Hash.new(0)
        scope.each { |item| h[item.product_id] += 1 }

        product_ids.each do |product_id|
          loader.call(product_id, h[product_id])
        end
      end
    end

    def batch_product_items
      BatchLoader.for(object.id).batch(default_value: [], key: :batch_product_items) do |product_ids, loader|
        scope = ProductItem.where(product_id: product_ids)

        scope.each do |item|
          loader.call(item.product_id) { |memo| memo << item }
        end
      end
    end
  end
end
