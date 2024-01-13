class RecipeFoodsController < ApplicationController
  before_action :set_recipe

  def new
    @recipe_food = @recipe.recipe_foods.build
    @foods = Food.all
  end

  def create
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)

    if @recipe_food.save
      redirect_to @recipe, notice: "Ingredient added successfully!"
    else
      @foods = Food.all
      render :new
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
