class SessionsController < ApplicationController

    def create
        user = User.find_or_create_by(username: params["session"]["username"])
        if user.valid?
            render json: user
        else
            render json: {errors: user.errors.full_messages}
        end
    end
    
end
