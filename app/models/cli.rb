# THIS DOES NOT BELONG IN MODELS. IT SHOULD BE IN LIB

class CLI

    attr_accessor :board

    def initialize
        self.board = Board.new
    end

    def user_input(input, *short)
        if gets.chomp == input
    end

    def render_board
        puts "     1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |"
        puts "   |-------------------------------|"
        self.board.spaces.each_with_index do |row, index|
        print " #{index + 1} | "
            row.each do |space|
                print space.value_to_s + " | "
            end
            print "\n"
        end
        true
    end

end