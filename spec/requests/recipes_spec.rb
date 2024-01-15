require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:recipe) { FactoryBot.create(:recipe, user:) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all recipes of the current user to @recipes' do
      get :index
      expect(assigns(:recipes)).to eq([recipe])
    end
  end

  describe 'GET #public_index' do
    it 'assigns all public recipes to @recipes' do
      get :public_index
      expect(assigns(:recipes)).to eq(Recipe.where(public: true).order('created_at DESC'))
    end
  end

  describe 'GET #show' do
    it 'assigns the requested recipe to @recipe' do
      get :show, params: { id: recipe.id }
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe 'GET #new' do
    it 'assigns a new recipe to @recipe' do
      get :new
      expect(assigns(:recipe)).to be_a_new(Recipe)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new recipe' do
        expect do
          post :create, params: { recipe: FactoryBot.attributes_for(:recipe) }
        end.to change(Recipe, :count).by(1)
      end

      it 'redirects to the new recipe' do
        post :create, params: { recipe: FactoryBot.attributes_for(:recipe) }
        expect(response).to redirect_to Recipe.last
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new recipe' do
        expect do
          post :create, params: { recipe: FactoryBot.attributes_for(:recipe, name: nil) }
        end.not_to change(Recipe, :count)
      end

      it 're-renders the new method' do
        post :create, params: { recipe: FactoryBot.attributes_for(:recipe, name: nil) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    it 'updates the recipe' do
      put :update, params: { id: recipe.id, recipe: FactoryBot.attributes_for(:recipe, name: 'New Recipe Name') }
      recipe.reload
      expect(recipe.name).to eq('New Recipe Name')
    end

    it 'redirects to the updated recipe' do
      put :update, params: { id: recipe.id, recipe: FactoryBot.attributes_for(:recipe) }
      expect(response).to redirect_to recipe
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the recipe' do
      recipe
      expect do
        delete :destroy, params: { id: recipe.id }
      end.to change(Recipe, :count).by(-1)
    end

    it 'redirects to recipes#index' do
      delete :destroy, params: { id: recipe.id }
      expect(response).to redirect_to recipes_path
    end
  end
end
