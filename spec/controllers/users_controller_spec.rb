require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end

    it "orders users by descending number of presentations given" do
      (1..10).each do |n|
        user = create(:user, name: "Ruby User #{n}", email: "user_#{n}@pinoyrb.org")
        # create n presentations for n-th user
        n.times do |presentation_count|
          event = create(:event)
          presentation = create(:presentation, event: event)
          speaker = create(:speaker, presentation: presentation, user: user)
        end
      end

      get 'index'

      presentation_counts = assigns(:users).map { |u| u.presentations.count }
      expect(presentation_counts).to eq((1..10).to_a.reverse)
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      user = FactoryGirl.create(:user)
      get 'show', id: user.slug
      expect(response).to be_success
    end

    it "requires the :id parameter" do
      expect { get :show }.to raise_error(ActionController::UrlGenerationError)
    end

    it "requires existing user" do
      expect { get :show, id: "fail" }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
