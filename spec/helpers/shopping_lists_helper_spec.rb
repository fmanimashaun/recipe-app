require 'rails_helper'

RSpec.describe ShoppingListsHelper, type: :helper do
  let(:user) { create(:user) }
  let(:food) { create(:food, user:, quantity: 5, price: 1.5) }
  let(:recipe) { create(:recipe, user:) }
  let!(:recipe_food) { create(:recipe_food, recipe:, food:, quantity: 10) }

  describe '#calculate_missing_foods' do
    it 'calculates missing foods, total missing items, and total price' do
      recipes = [recipe]
      available_foods = [food]
      missing_foods, total_missing_items, total_price = helper.calculate_missing_foods(recipes, available_foods)

      expect(missing_foods).to eq([{ name: food.name, quantity: 5, price: food.price }])
      expect(total_missing_items).to eq(1)
      expect(total_price).to eq(7.5)
    end
  end
end
