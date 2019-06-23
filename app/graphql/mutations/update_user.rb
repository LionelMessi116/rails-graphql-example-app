module Mutations
  class UpdateUser < Base

    argument :user_input, Types::UserInput, required: false

    def call(user_input: nil)
      return { route: current_user } unless user_input

      input_hash = user_input.to_h.symbolize_keys
      current_user.update!(input_hash)

      { route: current_user }
    end
  end
end
