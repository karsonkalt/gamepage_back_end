class BoardController < ApplicationController

    @@user_b = OthelloRuby::Game::User.new("black")
    @@user_w = OthelloRuby::Game::User.new("white")

    def new
        board = Board.new(first_move_color: "black", passive_move_color: "white")
        render json: {values: board.values, id: board.id}
    end

    def play
        board_id = params[:board]["boardId"]
        cell = params[:id]

        board = Board.find(board_id)

        if board.set(current_user(board), cell)
            render json: board.cells_to_be_flipped
        else
            render json: {error: "You can't play here"}
        end
    end

    private

    def current_user(board)
        if board.current_user == "black"
            @@user_b
        else
            @@user_w
        end
    end

end
