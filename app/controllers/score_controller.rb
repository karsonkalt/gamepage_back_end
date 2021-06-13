class ScoreController < ApplicationController

    def create
        # TODO change param to the param sent from the front end with the points in it.
        score = Score.create(user: User.find_by_username(params["username"]), points: params["score"])
        render json: score
    end

    def show
        #TODO change params with fetch request
        score = Score.find_by_id(params[:id])
        render json: score
    end

    def index
        scores = Score.all
        render json: scores
    end

end
