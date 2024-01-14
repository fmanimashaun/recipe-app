require "rails_helper"

RSpec.describe "Recipe Show Page", type: :system do
  before do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user)
    @recipe = FactoryBot.create(:recipe, user: @user)
    @food = FactoryBot.create(:food, user: @user)
    login_as(@user, scope: :user)
  end

  it "displays the correct content on the show page" do
    visit recipe_path(@recipe)

    expect(page).to have_content(@recipe.name)
    expect(page).to have_content("Preparation Time:")
    expect(page).to have_content("Cooking Time:")
    expect(page).to have_content("Steps go here...")
  end

  it "Add ingredients to recipe" do
    visit recipe_path(@recipe)

    click_on "Add Ingredient"

    select @food.name, from: "Food"
    fill_in "Quantity", with: "1"
    click_on "Add"

    expect(page).to have_content(@food.name)
    expect(page).to have_content("1")
  end
end
