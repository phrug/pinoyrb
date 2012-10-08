require 'spec_helper'

describe 'user registration' do
  it 'should allow user to register with an email address and a password' do
    visit root_path

    click_link 'Sign up'

    fill_in 'Email',                 with: 'test@example.com'
    fill_in 'Password',              with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'

    page.should have_content('Welcome! You have signed up successfully.')
  end
end