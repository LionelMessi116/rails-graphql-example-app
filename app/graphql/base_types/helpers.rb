# frozen_string_literal: true

module BaseTypes
  module Helpers
    def current_user_id
      context[:current_user]&.id
    end
  end
end
