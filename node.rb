
class Node
    attr_accessor :position, :parent, :adjacent_nodes

    def initialize(position)
        @position = position
        @adjacent_nodes = []
        @parent = nil
    end

    def add_edge(adjacent_node)
        @adjacent_nodes << adjacent_node
    end

end