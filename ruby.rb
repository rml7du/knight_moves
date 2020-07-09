
class Node
    attr_accessor :x, :y, :position, :coordinants, :left, :right
    def initialize(x, y)
        @position = [x,y]
        @left = nil
        @right = nil
        @x = position[0]
        @y = position[1]
        @coordinants = "[#{@x},#{@y}]"
    end
end

class Step
    attr_accessor :position, :children, :parent

    def initialize(position, children = nil, parent = nil)
        @position = position
        @children = []
        @parent = parent
    end
end


class Knight
    attr_accessor :board

    @@moves = [ [-1,2], [1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1] ]

    def initialize()
        @available_positions =  []
        @board = build_board()
        @root = build_tree(@board)
        @path = nil
    end

    def build_board()
        #create 64 nodes
        board = []
        8.times do |x|
            8.times { |y| board.push( Node.new(x+1, y+1) ) }
        end
        board.each { |node| @available_positions.push(node.position) }
        board 
    end

    def build_paths(starting, destination, queue = [Step.new(starting)])
        current = queue.shift
        puts starting == destination
        return nil if !valid_move(starting) || !@available_positions.include?(starting)
        #return "you made it" if starting
        if current.position == destination
            puts "you made it"
            return
        end
        #node = Step.new(starting)
        all_moves = find_moves(starting)
        @available_positions.delete_if { |x| x == starting } #remove location from remaining options
        
        all_moves.each do |move|
            child = Step.new(move)
            child.parent = current
            queue << child
            build_paths(starting, destination, queue)
        end
        
    end 
    
    def find_moves(starting, all_moves = [])
        @@moves.each do |move|
            next_move = [starting[0]+move[0], starting[1]+move[1]]
            all_moves << next_move unless !valid_move(next_move)
        end
        
        puts "allmoves: #{all_moves}"
        all_moves
    end



    def build_tree(array)
        return if array.empty?
        center = array.length/2
        node = array[center]
        node.left = build_tree(array[0...center])
        node.right = build_tree(array[center+1..-1])
        node
    end

    def valid_move(starting)
        if starting[0] <= 0 || starting[1] <= 0 || starting[0] > 8 || starting[1] > 8
            return false
        end
        true
    end
    
    def depth(node = @root) 
        return 0 if node == nil
        left_depth = depth(node.left)
        right_depth = depth(node.right)
        if left_depth > right_depth
            return left_depth + 1
        else 
            return right_depth + 1
        end
    end

    def knight_moves(starting, ending)
        
        build_paths(starting, ending)
        #build_tree()
        #puts "You made it in 3 moves! Heres your path:"

        #puts @available_positions.include?(starting)
        #@available_positions.delete_if { |x| x == starting } #remove location from remaining options
        #puts @available_positions.include?(starting)
        #print @available_positions
    end 

    def inorder(node = @root)
        return nil if node == nil
        inorder(node.left)
        print "#{node.coordinants} -> "
        inorder(node.right)
    end

    def search()
    end
end

wyatt = Knight.new()
#knight.board.each { |n| puts "#{n.coordinants}" }

wyatt.knight_moves([1,1], [8,8])

#knight_moves([3,3], [4,3])


=begin
#create 64 nodes
board = []
8.times do |x|
    8.times { |y| board.push( Node.new(x+1, y+1) ) }
end

board.each { |n| puts "#{n.coordinants}" }

tree = Tree.new(board)

tree.inorder()



board = Array.new(8, Array.new(8))
puts board

x = 7
y = 0
while x > 0
    while y < 8
        board[x].push(Node.new(x+1,y+1))
        y+=1
    end
    x-=1
end

board.each { |n|  print "#{n}\n" } 
=end