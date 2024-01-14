require 'rails_helper'

RSpec.describe "recipes/new", type: :view do
  let(:user) { create(:user) }
  let(:recipe) { build(:recipe, user: user) }

  before do
    assign(:recipe, recipe)
    render
  end

  it "displays the new recipe form" do
    expect(rendered).to include('Add new Recipe')
  end
end
