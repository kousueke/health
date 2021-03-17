class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_1, only: [:edit, :update, :destroy]

  def index
    @foods = Food.all.includes(:user).order('created_at DESC')
    @user = User.all
    @course = Course.all
    @course.find do |course|
      #   # if course.user_id.present? # コースにユーザーidを登録している場合、登録ありfood画面、登録なしcourse画面
      #   #   render :index
      #   # else
      #   #   redirect_to courses_path
      #   # end
    end
    # //コースがなければコース画面へ
    # @courses = Course.find_by(user_id: current_user.id
    # if @courses
    #   render :index
    # else
    #   redirect_to courses_path
    # end
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
