class ScoresController < ApplicationController

    def create
        score = Score.create(user: User.find_by_username(params["username"]), points: params["score"])
        render json: score
    end

    def index
        scores = Score.where(user_id: params[:user_id])

        seralized_scores = scores.map do |score|
            {points: score.points, created_at: score.created_at.strftime('%b %d, %Y at %l:%M%P')}
        end

        render json: seralized_scores
    end

end
