require 'rails_helper'

RSpec.describe "recipes/edit", type: :view do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user: user) }

  before do
    assign(:recipe, recipe)
    render
  end

  it "displays the edit recipe form" do
    expect(rendered).to include('Edit Recipe')
  end
end
