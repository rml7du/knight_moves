

class Board
    def build_board()
        #create 64 nodes
        board = []
        8.times do |x|
            8.times { |y| board.push( Node.new(x+1, y+1) ) }
        end
        board.each { |node| @available_positions.push(node.position) }
        board 
    end
end
