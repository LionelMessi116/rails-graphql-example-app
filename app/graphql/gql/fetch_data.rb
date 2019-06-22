module GQL
  class FetchData
    def self.call(query, variables: {}, context: {})
      result = GraphQlSchema.execute(
        query: query,
        variables: variables.stringify_keys,
        context: BuildUserContext.call(context[:current_user]).merge(context)
      )
      return M.Failure(result['errors']) if result.key?('errors')
      M.Success(result['data'])
    end
  end
end
