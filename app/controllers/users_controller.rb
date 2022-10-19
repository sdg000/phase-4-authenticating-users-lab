class UsersController < ApplicationController

    #action to allow user to remain login after page refresh
    # find user by their session[:user_id]
    # if found, render json to frontend. 
    # if NOT found, render error
    def show
        user = User.find_by(id: session[:user_id])
        if user
            render json: user, status: :ok
        else
            render json: {error: "Not authorized"}, status: :unauthorized
        end
        
    end

end
