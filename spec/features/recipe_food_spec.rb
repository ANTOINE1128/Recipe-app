require 'rails_helper'

RSpec.feature 'RecipeFoods', type: :feature do
  let(:user) { User.create(name: 'Binod', email: 'binod@example.com', password: 'password') }

  before(:each) do
    visit new_user_session_path
    fill_in 'email@example.com', with: user.email
    fill_in 'password', with: user.password
    click_button 'Log in'
    sleep 1
    visit foods_path
    click_link 'Add Food'
    fill_in 'Name', with: 'Apple'
    fill_in 'Measurement unit', with: 'grams'
    fill_in 'Price', with: '1.0'
    click_button 'Create Food'
    visit recipes_path
    click_link 'Add Recipe'
    expect(page).to have_content('New Recipe')
    fill_in 'Name', with: 'Apple dish'
    fill_in 'Preparation time', with: '1'
    fill_in 'Cooking time', with: '0.5'
    fill_in 'Description', with: 'This is my first apple dish created here'
    click_button 'Create Recipe'
    sleep 1
  end
  scenario 'Create/Edit/Delete an Recipe Food/Ingredient' do
    click_link 'Apple dish'
    click_link 'Add Ingredient'
    expect(page).to have_content('Add new ingredients')

    fill_in 'recipe_food[quantity]', with: '20'
    click_button 'Add'
    assert_text 'Ingredient created!', count: 1
    visit recipes_path
    click_link 'Apple dish'
    # Check if the ingredient details are displayed
    expect(page).to have_content('Apple')
    expect(page).to have_content('20 grams')
    expect(page).to have_content('$ 20')
    click_link 'Modify'
    fill_in 'recipe_food[quantity]', with: '10'
    click_button 'Modify'
    # Check if the modified quantity is displayed
    expect(page).to have_content('10 grams')
    expect(page).to have_content('$ 10.0')

    click_button 'Remove'
    sleep 1
    expect(page).not_to have_selector('tr', text: 'Apple')
  end
end
