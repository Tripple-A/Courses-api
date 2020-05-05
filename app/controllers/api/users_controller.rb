module Api
  class UsersController < ApplicationController

    def index
      @users = User.all
      render json: { status: 'ok', message: 'Loaded Contacts', data: @users }, status: :ok
    end

    def show
      username = params[:id]
      user = User.find_by(username: username)
      render json: { status: 'ok', message: 'Loaded Contacts', data: user }, status: :ok
    end

    private
    def user_params
    end
  end
end
