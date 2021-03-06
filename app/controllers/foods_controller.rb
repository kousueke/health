class FoodsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_1, only: [:index]
  # before_action :set_2
  # before_action :set_food3, only: [:index]

  def index
    # //コースがなければ選択画面へ遷移する設定

    @foods = Food.all.includes(:user).order('created_at DESC')
    @course = Course.all
    @user = User.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    food = Food.find(params[:id])
    food.update(food_params)
    redirect_to root_path
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to root_path
  end

  # def set_1
  #   redirect_to new_user_registration unless current_user.id == @course.user_id
  # end

  # def set_2
  #   redirect_to courses_path @course.courses_id=nil
  # end

  # def set_food3
  #   if user_signed_in? && @course.course_name_id == nil
  #     redirect_to courses_path
  #   end

  # def set_food3
  #   @course = Course.find(params[:id])
  #   redirect_to courses_path if current_user.id == @course.id
  # end

  private

  def food_params
    params.require(:food).permit(:name, :amount_of_protein, :number).merge(user_id: current_user.id, course_id: current_user.id)
  end
end
