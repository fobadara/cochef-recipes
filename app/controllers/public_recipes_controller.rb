class PublicRecipesController < ApplicationController
  before_action :authenticate_user!

  # GET /public_recipes
  def index
    @recipes = Food.all.order(created_at: :desc)
    # To be replaced when recipes are linked with foods
    # @recipes = Recipes.where(public: true).order(created_at: :desc)
  end

  def show
    @recipe = Food.find(params[:id])
  end
end
