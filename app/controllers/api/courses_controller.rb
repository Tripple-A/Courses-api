module Api
class CoursesController < ApplicationController
  
    def index
      @courses = Course.all
      render json: { status: 'ok', message: 'Loaded Courses', data: @courses }, status: :ok
    end

 
end
end
