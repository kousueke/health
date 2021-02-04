class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(courses_params)
    if @course.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def courses_params
    params.permit(:weight, :course_name).merge(user_id: current_user.id)
  end

end

