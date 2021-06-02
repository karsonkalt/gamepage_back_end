class Game < Reversi::Game

    def initialize
        Reversi.configure do |config|
            config.disk_color_b = 'cyan'
            config.disk_b = "X"
            config.disk_w = "O"
            config.progress = true
            config.player_b = Reversi::Player::Human
            config.player_w = Reversi::Player::RandomAI
        end
    end

end