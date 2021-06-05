class BoardController < ApplicationController

    def new
        @@board  = Board.new(first_move_color: "black", passive_move_color: "white" )
        @@user_b = OthelloRuby::Game::User.new("black")
        @@user_w = OthelloRuby::Game::User.new("white")

        show
    end

    def show
        #TODO ActiveRecord is firing for some reason?
        render json: @@board.values
    end

    def play

        

        #TODO figure out currentplayer method, should be a helper but tied to this class since I'm using class variables?
        # current_player = @@user_b

        # cell = params[:cell]
        # current_player.set(@@board, cell)
        # show
    end

    def score
        render json: {black: @@board.black_count, white: @@board.white_count}
    end

end
