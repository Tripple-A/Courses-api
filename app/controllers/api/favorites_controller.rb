module Api
  class FavoritesController < ApplicationController
    def create
        fav = Favorite.new(fav_params)

      if fav.save
        render json: { status: 'SUCCESS' }, status: :ok
      else
        render json: { status: 'ERROR', data: fav.errors }, status: :not_found
      end
    end
    private

    def fav_params
      params.permit(:user_id, :course_id)
    end
  end
end