require 'rails_helper'

RSpec.feature 'PublicRecipes', type: :feature do
  before :each do
    @user = User.new(name: 'Pepe Frog', email: 'test@example.com', password: 'password',
                     password_confirmation: 'password')
    @user.skip_confirmation!
    @user.save
    Recipe.create(name: 'Carne', preparation_time: 5, cooking_time: 5, description: 'Great Taste', public: true,
                  user_id: @user.id)
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: 'test@example.com'
      fill_in 'user_password', with: 'password'
    end
    click_button 'Log in'
  end

  it 'visits public recipes' do
    visit '/public_recipes'
    expect(page).to have_content 'Carne'
  end
end
