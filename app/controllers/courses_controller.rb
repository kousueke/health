class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = Course.all

    @courses.find do |course|
     if current_user.id && course.user_id # ログインユーザーのidとコースに登録しているユーザーidが同じ場合（同一人物）
      render :index
     else
      redirect_to foods_index_path
     end
    end

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

  def show
  end  

  private

  def courses_params
    params.permit(:weight, :course_name_id).merge(user_id: current_user.id)
  end

end

