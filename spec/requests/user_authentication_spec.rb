require 'spec_helper'

describe 'user authentication' do
  before(:all) do
    user = User.create(email: 'terence@example.com', password: 'password')
  end

  describe 'signing in' do
    it 'should allow users to sign in after they have registered' do
      visit root_path

      click_link 'Sign in'

      fill_in 'Email', with: 'terence@example.com'
      fill_in 'Password', with: 'password'

      click_button 'Sign in'

      page.should have_content('Signed in successfully.')
    end
  end

  describe 'signing out' do
    it 'should allow users to sign out when they are signed in' do
      visit root_path

      click_link 'Sign in'

      fill_in 'Email', with: 'terence@example.com'
      fill_in 'Password', with: 'password'

      click_button 'Sign in'

      click_link 'Sign out'

      page.should have_content('Signed out successfully.')
    end
  end
end