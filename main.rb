require_relative "board.rb"
require_relative "knight.rb"
require_relative "node.rb"


knight = Knight.new

knight.knight_moves([1,1], [8,8])
knight.knight_moves([5,1], [8,8])
knight.knight_moves([4,7], [2,3])