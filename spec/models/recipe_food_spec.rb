require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:food) { FactoryBot.create(:food, user:) }
  let(:recipe) { FactoryBot.create(:recipe, user:) }
  let(:recipe_food) { FactoryBot.build(:recipe_food, recipe:, food:) }

  it 'is valid with valid attributes' do
    expect(recipe_food).to be_valid
  end

  it 'is not valid without a quantity' do
    recipe_food.quantity = nil
    expect(recipe_food).not_to be_valid
  end

  it 'is not valid with a quantity less than or equal to 0' do
    recipe_food.quantity = 0
    expect(recipe_food).not_to be_valid
  end

  it 'is not valid without a recipe_id' do
    recipe_food.recipe_id = nil
    expect(recipe_food).not_to be_valid
  end

  it 'is not valid without a food_id' do
    recipe_food.food_id = nil
    expect(recipe_food).not_to be_valid
  end
end
