#build the Dijkstra's graph of connect moves.
require_relative "knight.rb"
require_relative "node.rb"

class Board #could also be called Graph

    @@moves = [ [-1,2], [1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1] ]

    def initialize(num)
        @available_positions = []
        @nodes = {}
        @visited = []
        build_board(num)
        build_graph()
        
    end

    def add_node(node)
        @nodes[node.value] = node
    end

    

    def build_graph(current = Node.new([1,1])) #creates graph of possible moves and links together
        return nil if !valid_move(current.position) || @visited.include?(current.position)
        all_moves = find_moves(current)
        @available_positions.delete_if { |x| x == current } #remove location from remaining options
        
        all_moves.each do |move|
            child = Node.new(move)
            child.parent = current
            current.add_edge(child)
            build_graph(child)
        end
    end

    def build_board(num)
        #create 64 nodes
        board = []
        num.times do |x|
            num.times { |y| board.push( Node.new([x+1, y+1]) ) }
        end
        board.each { |node| @available_positions.push(node.position) }
        board 
    end

    def find_moves(current, all_moves = [])
        current = current.position
        @@moves.each do |move|
            next_move = [current[0]+move[0], current[1]+move[1]]
            all_moves << next_move unless !valid_move(next_move)
        end
        
        puts "allmoves: #{all_moves}"
        all_moves
    end

    def valid_move(position)
        if position[0] <= 0 || position[1] <= 0 || position[0] > 8 || position[1] > 8
            return false
        end
        true
    end
end
