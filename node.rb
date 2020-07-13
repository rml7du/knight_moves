class Node
    attr_accessor :x, :y, :child_list, :parent_node

    def initialize(x,y)
        @x=x
        @y=y
        @child_list =[]
        @parent_node = nil
    end
end

