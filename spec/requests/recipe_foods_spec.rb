require 'rails_helper'

RSpec.describe RecipeFoodsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:recipe) { FactoryBot.create(:recipe, user:) }
  let(:food) { FactoryBot.create(:food, user:) }
  let(:recipe_food) do
    FactoryBot.create(:recipe_food, recipe:, food:)
  end

  before { sign_in user }

  describe 'GET #new' do
    it 'assigns a new recipe_food to @recipe_food' do
      get :new, params: { recipe_id: recipe.id }
      expect(assigns(:recipe_food)).to be_a_new(RecipeFood)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new recipe_food' do
        expect do
          post :create,
               params: {
                 recipe_id: recipe.id,
                 recipe_food:
                   FactoryBot.attributes_for(
                     :recipe_food,
                     food_id: food.id,
                     quantity: 1
                   )
               }
        end.to change(RecipeFood, :count).by(1)
      end

      it 'redirects to the recipe' do
        post :create,
             params: {
               recipe_id: recipe.id,
               recipe_food:
                 FactoryBot.attributes_for(
                   :recipe_food,
                   food_id: food.id,
                   quantity: 1
                 )
             }
        expect(response).to redirect_to recipe
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new recipe_food' do
        expect do
          post :create,
               params: {
                 recipe_id: recipe.id,
                 recipe_food:
                   FactoryBot.attributes_for(
                     :recipe_food,
                     food_id: nil,
                     quantity: 1
                   )
               }
        end.not_to change(RecipeFood, :count)
      end

      it 're-renders the new method' do
        post :create,
             params: {
               recipe_id: recipe.id,
               recipe_food:
                 FactoryBot.attributes_for(
                   :recipe_food,
                   food_id: nil,
                   quantity: 1
                 )
             }
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested recipe_food to @recipe_food' do
      get :edit, params: { recipe_id: recipe.id, id: recipe_food.id }
      expect(assigns(:recipe_food)).to eq(recipe_food)
    end
  end

  describe 'PUT #update' do
    it 'updates the recipe_food' do
      put :update,
          params: {
            recipe_id: recipe.id,
            id: recipe_food.id,
            recipe_food: FactoryBot.attributes_for(:recipe_food, quantity: 2)
          }
      recipe_food.reload
      expect(recipe_food.quantity).to eq(2)
    end

    it 'redirects to the recipe' do
      put :update,
          params: {
            recipe_id: recipe.id,
            id: recipe_food.id,
            recipe_food: FactoryBot.attributes_for(:recipe_food, quantity: 2)
          }
      expect(response).to redirect_to recipe
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the recipe_food' do
      recipe_food
      expect do
        delete :destroy, params: { recipe_id: recipe.id, id: recipe_food.id }
      end.to change(RecipeFood, :count).by(-1)
    end

    it 'redirects to recipes#index' do
      delete :destroy, params: { recipe_id: recipe.id, id: recipe_food.id }
      expect(response).to redirect_to recipe
    end
  end
end
