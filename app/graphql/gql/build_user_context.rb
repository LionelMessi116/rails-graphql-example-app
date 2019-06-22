module GQL
  class BuildUserContext
    def self.call(user, guest = nil)
      {
        current_user: user,
        guest: guest,
      }
    end
  end
end
