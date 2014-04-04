require 'spec_helper'

describe Event do
  it 'should generate slug on create' do
    FactoryGirl.create(:event, name: "Random Event").slug.should == "random-event"
  end

  describe "#to_ical_event" do

    it "returns an Icalendar::Event object" do
      event = FactoryGirl.create(:event, name: "Random Event")
      expect(event.to_ical_event).to be_a_kind_of(Icalendar::Event)
    end
  end
end
