class Board < OthelloRuby::Game::Bord
    include ActiveModel

    @previous_board = nil

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

        hash = {
            a1: arr[0][0], b1: arr[0][1], c1: arr[0][2], d1: arr[0][3], e1: arr[0][4], f1: arr[0][5], g1: arr[0][6], h1: arr[0][7],
            a2: arr[1][0], b2: arr[1][1], c2: arr[1][2], d2: arr[1][3], e2: arr[1][4], f2: arr[1][5], g2: arr[1][6], h2: arr[1][7],
            a3: arr[2][0], b3: arr[2][1], c3: arr[2][2], d3: arr[2][3], e3: arr[2][4], f3: arr[2][5], g3: arr[2][6], h3: arr[2][7],
            a4: arr[3][0], b4: arr[3][1], c4: arr[3][2], d4: arr[3][3], e4: arr[3][4], f4: arr[3][5], g4: arr[3][6], h4: arr[3][7],
            a5: arr[4][0], b5: arr[4][1], c5: arr[4][2], d5: arr[4][3], e5: arr[4][4], f5: arr[4][5], g5: arr[4][6], h5: arr[4][7],
            a6: arr[5][0], b6: arr[5][1], c6: arr[5][2], d6: arr[5][3], e6: arr[5][4], f6: arr[5][5], g6: arr[5][6], h6: arr[5][7],
            a7: arr[6][0], b7: arr[6][1], c7: arr[6][2], d7: arr[6][3], e7: arr[6][4], f7: arr[6][5], g7: arr[6][6], h7: arr[6][7],
            a8: arr[7][0], b8: arr[7][1], c8: arr[7][2], d8: arr[7][3], e8: arr[7][4], f8: arr[7][5], g8: arr[7][6], h8: arr[7][7]
        }
    end

    def flipped

    end

end