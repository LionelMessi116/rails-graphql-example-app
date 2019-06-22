module Types
  class QueryType < BaseTypes::BaseObject

    with_options guard: GraphQlPolicy::USER_OR_GUEST do
      non_nullable do
        field :products, ProductConnectionType,
          arguments: {
            is_deleted: { type: Boolean, required: false, default_value: false },
          }
        field :product, ProductType,
          arguments: {
            id: { type: ID, required: true },
          }
      end
    end

    with_options guard: GraphQlPolicy::AUTHENTICATED do
      non_nullable do
        field :user_profile, UserType
      end
    end

    def products(is_deleted:)
      Product.where(deleted: is_deleted)
    end

    def product(id:)
      Product.find_by(id: id)
    end

    def user_profile
      User.find_by(id: current_user_id)
    end
  end
end
