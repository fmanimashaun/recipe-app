require 'rails_helper'

RSpec.describe "Recipe Integration", type: :system do
  before do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user)
    login_as(@user, scope: :user)
  end

  let!(:recipe) { create(:recipe, name: 'Test Recipe', description: 'Test Description', user: @user) }

  it 'displays the correct content on the index page' do
    visit recipes_path

    expect(page).to have_content('Test Recipe')
    expect(page).to have_content('Test Description')
    expect(page).to have_link('Add Recipe', href: new_recipe_path)
    expect(page).to have_selector("form[action='#{recipe_path(recipe)}']")
  end

  it 'allows the user to add a new recipe' do
    visit recipes_path

    click_link 'Add Recipe'

    fill_in 'Name', with: 'New Recipe'
    fill_in 'Preparation time in hours', with: '1'
    fill_in 'Cooking time in hours', with: '1'
    fill_in 'Description', with: 'New Description'
    check 'Public'
    click_button 'Add'

    expect(page).to have_content('New Recipe')
    expect(page).to have_content('Preparation Time: 1 hour')
    expect(page).to have_content('Cooking Time: 1 hour')
    expect(page).to have_content('Steps go here...')
  end

  context 'when no recipes exist' do
    it 'displays a no recipes found message' do
      Recipe.destroy_all
      visit recipes_path

      expect(page).to have_content('No recipes found.')
    end
  end

  it 'displays the correct content on the show page' do
    visit recipe_path(recipe)

    expect(page).to have_content('Test Recipe')
    expect(page).to have_content('Preparation Time:')
    expect(page).to have_content('Cooking Time:')
    expect(page).to have_content('Steps go here...')
  end
end
