require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:food) { FactoryBot.create(:food, user:) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all foods of the current user to @foods' do
      get :index
      expect(assigns(:foods)).to eq([food])
    end
  end

  describe 'GET #new' do
    it 'assigns a new food to @food' do
      get :new
      expect(assigns(:food)).to be_a_new(Food)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new food' do
        expect do
          post :create, params: { food: FactoryBot.attributes_for(:food) }
        end.to change(Food, :count).by(1)
      end

      it 'redirects to the foods#index' do
        post :create, params: { food: FactoryBot.attributes_for(:food) }
        expect(response).to redirect_to foods_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new food' do
        expect do
          post :create, params: { food: FactoryBot.attributes_for(:food, name: nil) }
        end.not_to change(Food, :count)
      end

      it 're-renders the new method' do
        post :create, params: { food: FactoryBot.attributes_for(:food, name: nil) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the food' do
      food
      expect do
        delete :destroy, params: { id: food }
      end.to change(Food, :count).by(-1)
    end

    it 'redirects to foods#index' do
      delete :destroy, params: { id: food }
      expect(response).to redirect_to foods_path
    end
  end
end
