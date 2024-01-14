require 'rails_helper'

RSpec.describe "shopping_lists/index", type: :view do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user: user) }
  let(:food) { create(:food, user: user) }
  let!(:recipe_food) { create(:recipe_food, recipe: recipe, food: food, quantity: 10) }

  before do
    assign(:recipes, [recipe])
    assign(:available_foods, [food])
    assign(:missing_foods, [{ name: food.name, quantity: 5, price: food.price }])
    assign(:total_missing_items, 1)
    assign(:total_price, 7.5)
    render
  end

  it "displays the shopping list details" do
    expect(rendered).to include('Shopping List')
    expect(rendered).to include('Amount of Food items to buy: 1')
    expect(rendered).to include('Total value of food needed: $7.5')
    expect(rendered).to include(food.name)
  end
end
