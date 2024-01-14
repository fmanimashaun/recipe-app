require 'rails_helper'

RSpec.describe ShoppingListsController, type: :controller do
  let(:user) { create(:user) }
  let(:food) { create(:food, user: user) }
  let(:recipe) { create(:recipe, user: user) }
  let!(:recipe_food) { create(:recipe_food, recipe: recipe, food: food) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns @recipes, @available_foods, @missing_foods, @total_missing_items, and @total_price' do
      get :index
      expect(assigns(:recipes)).to eq([recipe])
      expect(assigns(:available_foods)).to eq([food])
      expect(assigns(:missing_foods)).to eq([])
      expect(assigns(:total_missing_items)).to eq(0)
      expect(assigns(:total_price)).to eq(0)
    end
  end
end
