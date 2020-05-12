module Api
  class CoursesController < ApplicationController
    def index
      @courses = Course.all
      render json: { status: 'ok', message: 'Loaded Courses', data: @courses }, status: :ok
    end

    def show
      course = Course.find(params[:id])
      if course
        render json: { status: 'ok', message: 'Loaded User', data: courses }, status: :ok
      else
        render json: { status: 500, message: 'Course not found' }, status: :not_found
      end
    end

  end
end
