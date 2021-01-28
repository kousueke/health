class FoodsController < ApplicationController
  before_action :authenticate_user!

  # before_action :set_1
  # before_action :set_2
  # before_action :set_food3, only: [:index]

  def index
    @foods = Food.all
    @course = Course.all
    @course = Course.new
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to :index
    else
      render :new
    end
    binding.pry
  end
  # def set_1
  #   redirect_to new_user_registration unless current_user.id == @course.user_id
  # end

  # def set_2
  #   redirect_to courses_path @course.courses_id=nil
  # end
  
  # det set_food3
  #   if user_signed_in? && @course.course_name_id == nil
  #     redirect_to courses_path
  #   end

  private

  def food_params
    params.require(:food).permit(:name, :amount_of_protein, :number).merge(user_id: current_user.id)
  end
end