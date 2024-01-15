require 'rails_helper'

RSpec.describe 'recipe_foods/edit', type: :view do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }
  let(:recipe_food) { create(:recipe_food, recipe:) }
  let(:foods) { create_list(:food, 3, user:) }

  before do
    assign(:recipe, recipe)
    assign(:recipe_food, recipe_food)
    assign(:foods, foods)
    render
  end

  it 'displays the edit recipe_food form' do
    expect(rendered).to include('Modify Ingredient')
  end
end
