module Types
  class UserInput < BaseTypes::BaseInputObject
    optional do
      argument :name, String
    end
  end
end
