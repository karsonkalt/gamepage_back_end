class SessionsController < ApplicationController

    def create
        user = User.find_or_create_by(username: params["session"]["username"])
        if user.valid?
            session[:user_id] = user.id
            render json: user
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def delete
        session[:user_id] = nil
        render json: session[:user_id]
    end

    private

    def logged_in?
        !!session[:user_id]
    end
end
