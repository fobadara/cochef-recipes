class FoodsController < ApplicationController
  before_action :authenticate_user!

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # POST /foods or /foods.json
  def create
    @user = current_user
    @food = @user.foods.create(food_params)

    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy!

    flash[:alert] = "#{@food.name} has been deleted succesfully"
    redirect_to foods_path
  end

  private

  # # Use callbacks to share common setup or constraints between actions.
  # def set_food
  #   @food = Food.find(params[:id])
  # end

  # Only allow a list of trusted parameters through.

  def food_params
    params.fetch(:food, {}).permit(:name, :measurement_unit, :price, :image)
  end
end
