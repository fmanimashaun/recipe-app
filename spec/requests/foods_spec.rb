require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:user) { create(:user) }
  let(:food_params) { { name: 'Apple', measurement_unit: 'kg', price: 2.50, quantity: 3 } }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all foods of the current user to @foods' do
      food = create(:food, user:)
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
    context 'with valid params' do
      it 'creates a new food' do
        expect { post :create, params: { food: food_params } }.to change(Food, :count).by(1)
      end

      it 'assigns the created food to @food' do
        post :create, params: { food: food_params }
        expect(assigns(:food)).to be_a(Food)
        expect(assigns(:food)).to be_persisted
      end

      it 'redirects to the foods index' do
        post :create, params: { food: food_params }
        expect(response).to redirect_to(foods_path)
      end

      it 'sets a success notice' do
        post :create, params: { food: food_params }
        expect(flash[:notice]).to eq('Food was successfully created.')
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved food to @food' do
        post :create, params: { food: { name: '' } } # Missing required fields
        expect(assigns(:food)).to be_a_new(Food)
      end

      it 're-renders the new template' do
        post :create, params: { food: { name: '' } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested food' do
      food = create(:food, user:)
      expect { delete :destroy, params: { id: food.to_param } }.to change(Food, :count).by(-1)
    end

    it 'redirects to the foods index' do
      food = create(:food, user:)
      delete :destroy, params: { id: food.to_param }
      expect(response).to redirect_to(foods_path)
    end

    it 'sets a success notice' do
      food = create(:food, user:)
      delete :destroy, params: { id: food.to_param }
      expect(flash[:notice]).to eq('Food was successfully deleted.')
    end
  end
end
