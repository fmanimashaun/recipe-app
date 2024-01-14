require 'rails_helper'

RSpec.describe 'foods/index', type: :view do
  let(:user) { create(:user) }
  let(:food) { create(:food, user:) }

  before do
    assign(:foods, [food])
    render
  end

  it 'displays the foods' do
    expect(rendered).to include(food.name)
  end
end
