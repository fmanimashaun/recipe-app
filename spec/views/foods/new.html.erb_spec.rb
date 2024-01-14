require 'rails_helper'

RSpec.describe 'foods/new', type: :view do
  let(:user) { create(:user) }
  let(:food) { build(:food, user:) }

  before do
    assign(:food, food)
    render
  end

  it 'displays the new food form' do
    expect(rendered).to include('Add new Food')
  end
end
