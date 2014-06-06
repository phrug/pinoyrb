require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe 'Admin page' do
  describe 'Dashboard' do
    it 'should kick me out if not logged in' do
      logout(:admin_user)
      visit rails_admin_path
      expect(page).not_to have_title("Site Administration | Pinoyrb Admin")
    end

    it 'should not kick me out if logged in' do
      user = FactoryGirl.create(:admin_user)
      login_as(user, :scope => :admin_user)
      visit rails_admin_path
      expect(page).to have_title("Site Administration | Pinoyrb Admin")
    end
  end
end
