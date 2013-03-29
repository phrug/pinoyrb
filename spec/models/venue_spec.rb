require 'spec_helper'

describe Venue do
  it 'should generate slug on create' do
    FactoryGirl.create(:venue, name: "Nowhere Land").slug.should == "nowhere-land"
  end
end
