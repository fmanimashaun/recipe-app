class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[public_index]
  before_action :set_recipe, only: %i[show]

  def index; end

  def public_index
    @recipes = Recipe.includes(:user, :recipe_foods).where(public: true).order('created_at DESC')
  end

  def show; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
