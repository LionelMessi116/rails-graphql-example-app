# frozen_string_literal: true

module BaseTypes
  module Helpers
    def current_user
      context[:current_user]
    end

    def current_user_id
      current_user&.id
    end
  end
end
