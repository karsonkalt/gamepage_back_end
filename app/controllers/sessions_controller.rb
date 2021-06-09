class SessionsController < ApplicationController

    def create
        user = User.find_or_create_by(username: params["session"]["username"])
        if user.valid?
            session[:user] = user
            render json: session[:user]
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def delete
        session[:user] = nil
        render json: session[:user]
    end

    private

    def logged_in?
        !!session[:user]
    end
end
