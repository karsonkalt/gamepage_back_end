class BoardController < ApplicationController

    def new
        #TODO can I use the session hash to store this?
        session[:board] = Board.new(first_move_color: "black", passive_move_color: "white" )
        session[:user_b] = OthelloRuby::Game::User.new("black")
        session[:user_w] = OthelloRuby::Game::User.new("white")
        # @@board  = Board.new(first_move_color: "black", passive_move_color: "white" )
        # @@user_b = OthelloRuby::Game::User.new("black")
        # @@user_w = OthelloRuby::Game::User.new("white")
        byebug
        show
    end

    def show
        #TODO ActiveRecord is firing for some reason?
        render json: session[:board].values
        # render json: @@board.values
    end

    def play
        cell = params[:id]
        byebug

        if session[:board].set(current_user, cell)
            render json: session[:board].cells_to_be_flipped
        else
            render json: {error: "You can't play here"}
        end



        # if @@board.set(current_user, cell)
        #     render json: @@board.cells_to_be_flipped
        # else
        #     render json: {error: "You can't play here"}
        # end




        #TODO figure out currentplayer method, should be a helper but tied to this class since I'm using class variables?
        # current_player = @@user_b

        # cell = params[:cell]
        # current_player.set(@@board, cell)
        # show
    end

    def score
        render json: {black: @@board.black_count, white: @@board.white_count}
    end

    private

    # def current_user
    #     if @@board.current_user == "black"
    #         @@user_b
    #     else
    #         @@user_w
    #     end
    # end

    def current_user
        if session[:board].current_user == "black"
            session[:user_b]
        else
            session[:user_w]
        end
    end

end
