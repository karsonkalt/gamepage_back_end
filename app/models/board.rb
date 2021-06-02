class Board
    include ActiveModel::Serializers::JSON

    attr_accessor :spaces

    def initialize
        self.spaces = []
        8.times do
            self.spaces << Array.new(8) {Space.new}
        end
        # TODO this sould not be in the board class, this should be managed by the piece
        self.space(4, 4).value = "X"
        self.space(4, 5).value = "O"
        self.space(5, 4).value = "O"
        self.space(5, 5).value = "X"
    end

    def space(row, column)
        self.spaces[row - 1][column - 1]
    end

    def play(row, column)
        self.space(row, column).value = self.token
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
        self.spaces.flatten.each do |space|
            counter += 1 unless space.value == nil
        end
        counter - 4
    end

end