module Api
class AuthController < ApplicationController
    def login 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          payload = {user_id: user.id}
          token = encode_token(payload)
          render json: { status: 'SUCCESS', jwt: token }, status: :ok
        end
    end

    def auto_login
        courses = Course.all
        if session_user
            render json: { status: 200, user:session_user, courses:courses } 
        else
            render json: {errors: 'No user logged in'}
        end
    end
end
end
