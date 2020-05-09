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
        if session_user
            render json: session_user
        else
            render json: {errors: 'No user logged in'}
        end
    end
end
end
