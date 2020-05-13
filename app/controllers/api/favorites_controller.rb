module Api
  class FavoritesController < ApplicationController
    def create
        user_id = User.find_by(username: params[:username]).id
        course_id = params[:course_id]
        if User.find(user_id).favorites.where(course_id:course_id).present?
          render json: { data: 'Favorite already exists' }, status: :ok
        else
          fav = Favorite.new(user_id: user_id, course_id: course_id)
          if fav.save
            render json: { data: 'Favorite saved' }, status: :ok
          else
            render json: { data: 'There was a problem saving this course to your favorites' }, status: :not_found
          end
        end 
    end

    private

    def fav_params
      params.permit(:user_id, :course_id)
    end
  end
end