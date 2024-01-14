require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }

  before do
    assign(:recipes, [recipe])
    render
  end

  it 'displays the recipes' do
    expect(rendered).to include(recipe.name)
    expect(rendered).to include('Remove')
  end
end
