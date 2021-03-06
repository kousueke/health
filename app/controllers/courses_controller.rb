class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_1, only: [:edit, :update, :show]
  

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

  def edit
  end

  def update
    if @course.update(courses_params)
      redirect_to course_path(@course.id)
    else
      render :edit
    end
  end

  private

  def courses_params
    params.permit(:weight, :course_name_id).merge(user_id: current_user.id)
  end

  def set_1
    @course = Course.find(params[:id])
  end


end
