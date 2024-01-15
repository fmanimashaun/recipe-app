require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:recipe) { FactoryBot.build(:recipe, user:) }

  it 'is valid with valid attributes' do
    expect(recipe).to be_valid
  end

  it 'is not valid without a name' do
    recipe.name = nil
    expect(recipe).not_to be_valid
  end

  it 'is not valid without a preparation_time' do
    recipe.preparation_time = nil
    expect(recipe).not_to be_valid
  end

  it 'is not valid with a preparation_time less than or equal to 0' do
    recipe.preparation_time = 0
    expect(recipe).not_to be_valid
  end

  it 'is not valid without a cooking_time' do
    recipe.cooking_time = nil
    expect(recipe).not_to be_valid
  end

  it 'is not valid with a cooking_time less than or equal to 0' do
    recipe.cooking_time = 0
    expect(recipe).not_to be_valid
  end

  it 'is not valid without a description' do
    recipe.description = nil
    expect(recipe).not_to be_valid
  end

  it 'is not valid without a public attribute' do
    recipe.public = nil
    expect(recipe).not_to be_valid
  end

  describe '#foods' do
    it 'can have many foods' do
      recipe.save
      FactoryBot.create(:recipe_food, recipe:)
      FactoryBot.create(:recipe_food, recipe:)

      expect(recipe.foods.length).to eq 2
    end
  end
end
