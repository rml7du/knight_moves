class Node
    attr_accessor :x, :y, :child_list, :parent_node

    def initialize(x,y)
        @x=x
        @y=y
        @child_list =[]
        @parent_node = nil
    end
end

class Board
    attr_accessor :cell_list

    def initialize(num)
        @cell_list = []
        (1..num).each { |x| (1..num).each { |y| @cell_list.push( Node.new(x,y) ) } } 
    end
end

class Knight

    def initialize
        @allMoves = Board.new(8)
        @allMoves.cell_list.each { |cell| set_children(cell)}
    end

    def set_children(node)
        node.child_list.push(node_at(node.x+2,node.y-1)) unless node_at(node.x+2,node.y-1).nil?
        node.child_list.push(node_at(node.x+2,node.y+1)) unless node_at(node.x+2,node.y+1).nil?
        node.child_list.push(node_at(node.x+1,node.y-2)) unless node_at(node.x+1,node.y-2).nil?
        node.child_list.push(node_at(node.x+1,node.y+2)) unless node_at(node.x+1,node.y+2).nil?
        node.child_list.push(node_at(node.x-1,node.y-2)) unless node_at(node.x-1,node.y-2).nil?
        node.child_list.push(node_at(node.x-1,node.y+2)) unless node_at(node.x-1,node.y+2).nil?
        node.child_list.push(node_at(node.x-2,node.y-1)) unless node_at(node.x-2,node.y-1).nil?
        node.child_list.push(node_at(node.x-2,node.y+1)) unless node_at(node.x-2,node.y+1).nil?
    end

    def node_at(x,y)
        return x.between?(1,8) && y.between?(1,8) ? @allMoves.cell_list.find { |node| node.x == x && node.y == y} : nil
    end

    def knight_moves(origin, target)
        origin_node = node_at(origin[0],origin[1])
        target_node = node_at(target[0],target[1])
        node_found = breadth_first_search(origin_node, target_node)
        total_moves(node_found, target_node)
    end

    def total_moves(node, origin)
        moves = []

        until node == origin
            moves.push([node.x, node.y])
            node = node.parent_node
        end
        moves.push([node.x, node.y])

        puts "you made it in #{moves.length - 1} moves! Here is your path:"
        moves.reverse.each {|coord| print coord }
        @allMoves.cell_list.each { |node| node.parent_node = nil }
    end

    def set_parent_node(node)
        node.child_list.each { |child| child.parent_node = node if child.parent_node.nil? }
    end

    def breadth_first_search(origin, target)
        queue = [origin]
        until queue.empty?
            node = queue.shift

            if node.x == target.x && node.y == target.y
                return node
            else
                set_parent_node(node)
                queue = queue + node.child_list
            end
        end
    end

end

knight = Knight.new

knight.knight_moves([1,1], [8,8])
knight.knight_moves([5,1], [8,8])
knight.knight_moves([4,7], [2,3])