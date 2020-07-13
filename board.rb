require_relative "knight.rb"
require_relative "node.rb"

class Board
    attr_accessor :cell_list

    def initialize(num)
        @cell_list = []
        (1..num).each { |x| (1..num).each { |y| @cell_list.push( Node.new(x,y) ) } } 
    end
end