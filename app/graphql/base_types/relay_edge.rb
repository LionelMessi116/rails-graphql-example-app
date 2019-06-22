# frozen_string_literal: true

module BaseTypes
  class RelayEdge < GraphQL::Types::Relay::BaseEdge
    include Nullable
    include Helpers

    class << self
      # Override nodes to change nullability
      # https://github.com/rmosolgo/graphql-ruby/issues/1217
      def node_type(node_type = nil)
        if node_type
          @node_type = node_type
          wrapped_type_name = node_type.graphql_name
          # Set this to be named like the node type, but suffixed with `Edge`
          graphql_name("#{wrapped_type_name}Edge")
          # Add a default `node` field
          field :node, node_type,
            null: false,
            description: 'The item at the end of the edge.'
        end
        @node_type
      end
    end
  end
end
