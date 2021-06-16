class UsersController < ApplicationController

    def index
        users = User.top_users
        render json: users
    end 

end
