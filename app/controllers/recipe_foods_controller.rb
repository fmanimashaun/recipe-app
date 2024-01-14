class RecipeFoodsController < ApplicationController
  before_action :set_recipe
  before_action :set_recipe_food, only: %i[edit update destroy]
  before_action :set_foods, only: %i[new edit create update]

  def new
    @recipe_food = @recipe.recipe_foods.build
  end

  def create
    @recipe_food = @recipe.recipe_foods.find_by(food_id: recipe_food_params[:food_id])
    if @recipe_food
      # Update quantity if RecipeFood already exists
      @recipe_food.quantity += recipe_food_params[:quantity].to_i
    else
      # Build new RecipeFood if it doesn't exist
      @recipe_food = @recipe.recipe_foods.build(recipe_food_params)
    end

    if @recipe_food.save
      redirect_to @recipe, notice: 'Ingredient added successfully!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @recipe_food.update(recipe_food_params)
      redirect_to @recipe, notice: 'Ingredient updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @recipe_food.destroy
    redirect_to @recipe, notice: 'Ingredient removed successfully!'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def set_foods
    @foods = Food.where(user: current_user)
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
