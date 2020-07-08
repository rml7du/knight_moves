
class Node
    attr_accessor :x, :y, :coordinants, :right, :left
    def initialize(x,y)
        @x = x
        @y = y
        @left = nil
        @right = nil
        @coordinants = "[#{@x},#{@y}]"
    end
end

class Knight
    attr_accessor :board

    def initialize()
        @board = build_board()
        @root = build_tree(@board)
    end

    def build_board()
        #create 64 nodes
        board = []
        8.times do |x|
            8.times { |y| board.push( Node.new(x+1, y+1) ) }
        end
        board
    end

    def build_tree(array)
        return if array.empty?
        center = array.length/2
        node = array[center]
        node.left = build_tree(array[0...center])
        node.right = build_tree(array[center+1..-1])
        node
    end

    def valid_move(x, y)
        if x < 0 || y < 0 || x > 8 || y > 8
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

    def knight_moves()
        moves = [[-1,2],[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1]]
        #build_tree()
        puts "You made it in 3 moves! Heres your path:"
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

knight = Knight.new()
#puts knight.board.coordinants
knight.board.each { |n| puts "#{n.coordinants}" }

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