class GraphQlSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  use BatchLoader::GraphQL
  use GraphQL::Guard.new(
    not_authorized: ->(type, field) { GraphQL::ExecutionError.new("Not authorized to access #{type}.#{field}") }
  )
end
