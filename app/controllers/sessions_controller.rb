class SessionsController < ApplicationController

    #action to find user , login user,  tracker userID with sessions
    def create
        # find user by username
        user = User.find_by(username: params[:username])

        #if found set user.id to sessions[:user_id] for tracking user logins
        session[:user_id] = user.id

        #render user to frontend
        render json: user

    end

    #action to logout user and delete userID from sessions.
    def destroy
        #deletes user's ID from sessions, meaning, user is essentially logged out, not tracked by sessions anymore
        session.delete :user_id
        head :no_content
    end


    
end
