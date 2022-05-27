class GeneralShoppingListsController < ApplicationController
  before_action :authenticate_user!

  # GET /general_shopping_lists
  def index
    # Should show the list of food that is missing for all recipes of the logged-in user.
    @list = Food.all
    # Replace at list with one of the below when you link with recipes
    # Recipe_Food.includes(:food).includes(:recipe).where(user_id: current_user.id)
    # Food.where(user_id: current_user.id).where.not(id: current_user.recipes.pluck(:food_id))
    @list_count = @list.count
    @list_total_price = @list.sum(:price)
  end
end
