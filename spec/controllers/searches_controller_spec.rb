require 'spec_helper'

describe SearchesController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      expect(response).to be_success
    end
  end

  describe "GET 'show' with query" do
    it "returns http success" do
      FactoryGirl.create(:event, name: "test")
      FactoryGirl.create(:tag, name: "test")
      get 'show', q: "test"
      expect(response).to be_success
    end
  end
end
