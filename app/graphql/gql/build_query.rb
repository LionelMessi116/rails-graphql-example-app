module GQL
  class BuildQuery
    def self.call(*files)
      files.map { |f| GraphQL.parse_file(f).to_query_string }.join("\n")
    end
  end
end
