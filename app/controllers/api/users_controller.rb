module Api
  class UsersController < ApplicationController

    def index
      @users = User.all
      render json: { status: 'ok', message: 'Loaded Users', data: @users }, status: :ok
    end

    def show
      username = params[:id]
      user = User.find_by(username: username)
      if user
      render json: { status: 'ok', message: 'Loaded User', data: user }, status: :ok
      else
      render json: { status: 500, message: 'User not found'}, status: :not_found
      end
    end

    def create
      user = User.new(user_params)

      if user.save
        render json: { status: 'SUCCESS', message: 'Saved User', data: user }, status: :ok
      else
        render json: { status: 'ERROR', message: 'User not saved', data: user.errors }, status: :not_found
      end

    end

    private
    def user_params
      params.permit(:username, :password)
    end
  end
end
