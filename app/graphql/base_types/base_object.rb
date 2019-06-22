module BaseTypes
  class BaseObject < GraphQL::Schema::Object
    include Nullable
    include Helpers
  end
end
