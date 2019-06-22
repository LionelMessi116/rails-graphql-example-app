# frozen_string_literal: true

module BaseTypes
  class RelayConnection < GraphQL::Types::Relay::BaseConnection
    include Nullable
    include Helpers

    class << self
      # Override nodes to change nullability
      # https://github.com/rmosolgo/graphql-ruby/issues/1217
      def edge_type(
        edge_type_class,
        edge_class: GraphQL::Relay::Edge,
        node_type: edge_type_class.node_type,
        nodes_field: true
      )
        # Set this connection's graphql name
        node_type_name = node_type.graphql_name

        @node_type = node_type
        @edge_type = edge_type_class

        field :edges, [edge_type_class, null: true],
          null: true,
          description: 'A list of edges.',
          method: :edge_nodes,
          edge_class: edge_class

        if nodes_field
          field :nodes, [@node_type],
            null: false,
            description: 'A list of nodes.'
        end

        description("The connection type for #{node_type_name}.")
      end
    end
  end
end
