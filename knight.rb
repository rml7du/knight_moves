require_relative "node.rb"
require_relative "board.rb"

class Knight
    attr_accessor :nodes
  
    def initialize
      @nodes = {}
    end
    
    def add_node(node)
      @nodes[node.position] = node
    end
    
    def add_edge(node1.position, node2.position)
      @nodes[node1].add_edge(@nodes[node2])
      @nodes[node2].add_edge(@nodes[node1])
    end
    
  end