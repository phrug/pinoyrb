require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      user = FactoryGirl.create(:user)
      get 'show', id: user.slug
      expect(response).to be_success
    end

    it "requires the :id parameter" do
      expect { get :show }.to raise_error(ActionController::RoutingError)
    end

    it "requires existing user" do
      expect { get :show, id: "fail" }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
