require 'spec_helper'

describe EventsController do
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'index.ics'" do
    it "returns http success" do
      event = FactoryGirl.create(:event)
      get 'index', format: 'ics'
      response.should be_success
    end
  end
end
