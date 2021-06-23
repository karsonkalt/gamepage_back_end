class Board < OthelloRuby::Game::Bord

    @@all = []
    @@board_id = 0
    
    attr_accessor :id
    
    def initialize(arg)
        @previous_boards = []
        @@board_id += 1
        self.id = @@board_id
        @@all << self
        super(arg)
    end

    def values
        rows = show.split("+---+---+---+---+---+---+---+---+")
        rows.shift
        arr = []
        rows.each do |row|
            temp_row = row.split(" | ")
            temp_row.last.delete!("|\n")
            last = temp_row.pop
            last = last.split("")[0]
            temp_row << last
            temp_row.shift
            arr << temp_row
        end
        arr.pop

        arr = arr.map do |row|
            row.map do |cell|
                if cell == " "
                    "not-played"
                elsif cell == "1"
                    "black"
                elsif cell == "0"
                    "white"
                end
            end
        end

        hash = {
            "1a" => arr[0][0], "1b" => arr[0][1], "1c" => arr[0][2], "1d" => arr[0][3], "1e" => arr[0][4], "1f" => arr[0][5], "1g" => arr[0][6], "1h" => arr[0][7],
            "2a" => arr[1][0], "2b" => arr[1][1], "2c" => arr[1][2], "2d" => arr[1][3], "2e" => arr[1][4], "2f" => arr[1][5], "2g" => arr[1][6], "2h" => arr[1][7],
            "3a" => arr[2][0], "3b" => arr[2][1], "3c" => arr[2][2], "3d" => arr[2][3], "3e" => arr[2][4], "3f" => arr[2][5], "3g" => arr[2][6], "3h" => arr[2][7],
            "4a" => arr[3][0], "4b" => arr[3][1], "4c" => arr[3][2], "4d" => arr[3][3], "4e" => arr[3][4], "4f" => arr[3][5], "4g" => arr[3][6], "4h" => arr[3][7],
            "5a" => arr[4][0], "5b" => arr[4][1], "5c" => arr[4][2], "5d" => arr[4][3], "5e" => arr[4][4], "5f" => arr[4][5], "5g" => arr[4][6], "5h" => arr[4][7],
            "6a" => arr[5][0], "6b" => arr[5][1], "6c" => arr[5][2], "6d" => arr[5][3], "6e" => arr[5][4], "6f" => arr[5][5], "6g" => arr[5][6], "6h" => arr[5][7],
            "7a" => arr[6][0], "7b" => arr[6][1], "7c" => arr[6][2], "7d" => arr[6][3], "7e" => arr[6][4], "7f" => arr[6][5], "7g" => arr[6][6], "7h" => arr[6][7],
            "8a" => arr[7][0], "8b" => arr[7][1], "8c" => arr[7][2], "8d" => arr[7][3], "8e" => arr[7][4], "8f" => arr[7][5], "8g" => arr[7][6], "8h" => arr[7][7]
        }
    end

    def set(user, cell)
        unless @previous_boards.include?(self.values)
            @previous_boards << self.values
        end
        user.set(self, cell)
    end

    def cells_to_be_flipped
        diff = Hashdiff.diff(@previous_boards.last, self.values)
        hash = {}
        diff.each do |cell_update_info|
            hash[cell_update_info[1]] = cell_update_info[3]
        end
        hash
    end

    def turn_count
        self.values.values.count do |value|
            value == "black" || value == "white"
        end
    end

    def current_user
        if turn_count.even?
            "black"
        else
            "white"
        end
    end

    #Class Methods
    def self.all
        @@all
    end

    def self.find(id)
        @@all.select {|board| board.id == id}.first
    end

end