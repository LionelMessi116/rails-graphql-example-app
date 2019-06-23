module BaseTypes
  class BaseInputObject < GraphQL::Schema::InputObject
    include Helpers
    include Requirable
  end
end
