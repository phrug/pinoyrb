require 'spec_helper'

describe Event do
  it 'should generate slug on create' do
    FactoryGirl.create(:event, name: "Random Event").slug.should == "random-event"
  end
end
