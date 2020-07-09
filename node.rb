
class Node
    attr_reader :position

    def initialize(position)
        @position = position
        @adjacent_nodes = []
    end

    def add_edge(adjacent_node)
        @adjacent_nodes << adjacent_node
    end

end