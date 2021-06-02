class Game

    attr_accessor :board

    DIRECTIONS = [
        [-1, -1],
        [0, -1],
        [1, -1],
        [1, 0],
        [1, 1],
        [0, 1],
        [-1, 1],
        [-1, 0]
    ]

    def initialize
        self.board = Board.new
    end

    def playable_spaces
        playable_spaces = []

        board.spaces.each_with_index do |row, row_index|
            row.each_with_index do |column, column_index|
                DIRECTIONS.each do |row_direction, column_direction|
                    
                end
        end
    end

    def play(row, column)
        board.space(row, column).value = token
    end

    #TODO I don't like this method

    def play_if_playable(row, column)
        if board.space(row, column).playable?
            self.play(row, column)
            true
        else
            false
        end
    end

    def token
        if self.turn_count.even?
            "X"
        else
            "O"
        end
    end

    def turn_count
        counter = 0
        board.spaces.flatten.each do |space|
            counter += 1 unless space.value == nil
        end
        counter - 4
    end

    def over?
        turn_count >= 60 ? true : false
    end
end