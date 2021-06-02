class Board
    include ActiveModel::Serializers::JSON

    attr_accessor :spaces

    def initialize
        self.spaces = []
        8.times do
            self.spaces << Array.new(8) {Space.new}
        end
        self.space(4, 4).value = "X"
        self.space(4, 5).value = "O"
        self.space(5, 4).value = "O"
        self.space(5, 5).value = "X"
    end

    def space(row, column)
        self.spaces[row - 1][column - 1]
    end

    def render
        puts "     1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |"
        puts "   |-------------------------------|"
        self.spaces.each_with_index do |row, index|
        print " #{index + 1} | "
            row.each do |space|
                print space.value_to_s + " | "
            end
            print "\n"
        end
        true
    end

    def play(row, column)
        self.space(row, column).value = "X"
    end

    def turns
        counter = 0
        self.spaces.each do |space|
            byebug
            if space.value != nil : counter++ end
        end
        counter - 4
    end

end