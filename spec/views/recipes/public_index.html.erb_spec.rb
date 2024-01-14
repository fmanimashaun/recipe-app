require 'rails_helper'

RSpec.describe "recipes/public_index", type: :view do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user: user) }

  before do
    assign(:recipes, [recipe])
    render
  end

  it "displays the public recipes" do
    expect(rendered).to include(recipe.name)
    expect(rendered).to include(user.name)
  end
end
