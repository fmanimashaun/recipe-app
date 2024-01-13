class ShoppingListsController < ApplicationController
  include ShoppingListsHelper
  before_action :authenticate_user!

  def index
    @recipes = Recipe.includes(recipe_foods: :food).where(user: current_user)
    @available_foods = Food.where(user: current_user)
    @missing_foods, @total_missing_items, @total_price = calculate_missing_foods(@recipes, @available_foods)
  end
end
