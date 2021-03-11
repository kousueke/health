class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_1, only: [:edit, :update, :destroy]

  def index
    # //コースがなければコース選択画面へ遷移する設定
    @foods = Food.all.includes(:user).order('created_at DESC')
    @user = User.all
    @course = Course.all
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
  end

  def update
    if @food.update(food_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to root_path
  end


  private

  def food_params
    params.require(:food).permit(:name, :amount_of_protein, :number).merge(user_id: current_user.id, course_id: current_user.id)
  end

  def set_1
    @food = Food.find(params[:id])
  end
end
