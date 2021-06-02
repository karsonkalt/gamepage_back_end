# THIS DOES NOT BELONG IN MODELS. IT SHOULD BE IN LIB

class Cli

    attr_accessor :board

    def initialize
        self.board = Board.new
    end

    def menu
        puts "Welcome to Othello"
        render_board
        until self.board.over?
            self.turn
        end
    end

    def turn
        puts "#{board.token}'s turn"
        row = get_row
        column = get_column
        unless board.play_if_playable(row, column)
            puts "That space is not playable, try again"
            turn
        end
        render_board
    end

    def get_row
        puts "Please enter the row"
        row = gets.chomp.to_i
        if row < 9 && row > 0
            row
        else
            puts "Invalid input"
            get_row
        end
    end

    def get_column
        puts "Please enter the column"
        column = gets.chomp.to_i
        if column < 9 && column > 0
            column
        else
            puts "Invalid input"
            get_column
        end
    end

    def route(shortcut)
        gets.chomp == shortcut ? true : false
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
        puts ""
        true
    end

end