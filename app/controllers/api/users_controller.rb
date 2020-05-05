module Api
  class UsersController < ApplicationController

    def index
      @users = User.all
      render json: { status: 'ok', message: 'Loaded Contacts', data: @users }, status: :ok
    end
  end
end
