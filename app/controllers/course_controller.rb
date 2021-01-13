class CourseController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to root_path
    else
      render :new
    end
  end

  def course_params
    params.require(:course).permit(
      :body_weight, :target_value, :course_name_id).merge(user_id: current_user.id)
  end
end
