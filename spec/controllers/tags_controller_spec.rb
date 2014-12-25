require 'spec_helper'

describe TagsController do
  describe "GET 'index'" do
    it "returns http success" do
      FactoryGirl.create(:tag)
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      tag = FactoryGirl.create(:tag)
      get 'show', id: tag.slug
      expect(response).to be_success
    end

    it "requires the :id parameter" do
      expect { get :show }.to raise_error(ActionController::UrlGenerationError)
    end

    it "requires existing tag" do
      expect { get :show, id: "fail" }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
