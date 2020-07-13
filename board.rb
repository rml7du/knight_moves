#build the Dijkstra's graph of connect moves.
require_relative "knight.rb"
require_relative "node.rb"

class Board #could also be called Graph

    @@moves = [ [-1,2], [1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1] ]

    def initialize(num)
        @knight = Knight.new
        @available_positions = []
        @nodes = {}
        @visited = []
        @queue = []
        build_board(num)
        build_graph()
        #print_queue()
        print @knight.nodes
    end

    def add_node(node)
        @nodes[node.value] = node
    end

    def print_queue()
        @queue.each do |x|
            puts "\n\nnode:"
            print x 
            print x.position
            puts "\nparent:"
            print x.parent.position unless x.parent == nil
            
        end
    end

    def build_graph(current = Node.new([1,1])) #creates graph of possible moves and links together
        return if @visited.length == 64
        @knight.add_node(current) if current.position == [1,1]
        #puts @knight.nodes
        all_moves = find_moves(current)
        @available_positions.delete_if { |x| x == current.position } #remove location from remaining options
        @visited << current.position
        
        all_moves.each do |move|
            child = Node.new(move)
            child.parent = current
            @knight.add_node(child)
            @knight.add_edges(current.position, child.position)
            @queue << child
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

    def find_moves(current)
        all_moves = []
        current = current.position
        @@moves.each do |move|
            next_move = [current[0]+move[0], current[1]+move[1]]
            all_moves << next_move unless !valid_move(next_move) || @visited.include?(next_move) || all_moves.include?(next_move)
        end
        all_moves
    end

    def valid_move(position)
        if position[0] <= 0 || position[1] <= 0 || position[0] > 8 || position[1] > 8
            return false
        end
        true
    end
end
