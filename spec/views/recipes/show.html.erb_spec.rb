require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }
  let(:food) { create(:food, user:) }
  let!(:recipe_food) { create(:recipe_food, recipe:, food:) }

  before do
    assign(:recipe, recipe)
    assign(:recipe_food, [recipe_food])
    render
  end

  it 'displays the recipe details' do
    expect(rendered).to include(recipe.name)
    expect(rendered).to include('Preparation Time:')
    expect(rendered).to include('Cooking Time:')
    expect(rendered).to include(food.name)
  end
end
