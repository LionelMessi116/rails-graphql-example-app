module Types
  class MutationType < BaseTypes::BaseObject

    with_options guard: GraphQlPolicy::AUTHENTICATED do
      {
        update_user: Mutations::UpdateUser
      }.each do |name, mutation|
        field name, mutation: mutation
      end
    end
  end
end
