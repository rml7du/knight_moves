#build the Dijkstra's graph of connect moves.
require_relative "knight.rb"
require_relative "node.rb"

class Board #could also be called Graph

    @@moves = [ [-1,2], [1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1] ]

    def initialize(num)
        @available_positions
        build_board(num)
        @nodes = {}
    end

    def add_node(node)
        @nodes[node.value] = node
    end

    def add_edge(node1, node2)
        @nodes[node1].add_edge(@nodes[node2])
        @nodes[node2].add_edge(@nodes[node1])
    end

    def build_graph(position = [1,1]) #creates graph of possible moves and links together

    end

    def build_board(num)
        #create 64 nodes
        board = []
        num.times do |x|
            num.times { |y| board.push( Node.new(x+1, y+1) ) }
        end
        board.each { |node| @available_positions.push(node.position) }
        board 
    end

    def find_moves(starting, all_moves = [])
        @@moves.each do |move|
            next_move = [starting[0]+move[0], starting[1]+move[1]]
            all_moves << next_move unless !valid_move(next_move)
        end
        
        puts "allmoves: #{all_moves}"
        all_moves
    end
end
