require 'spec_helper'

describe EventsHelper do
  context "#next_meetup" do
    it "should display next month's 3rd thursday on nil" do
      expect(helper.next_meetup(nil)).to eq("#{l next_3rd_thurs(Date.today), :format => :long}, venue TBA")
    end
    it "should display next meetup's date and venue" do
      event = FactoryGirl.create(:event)
      expect(helper.next_meetup(event)).to eq(link_to "#{l event.start_at.to_date, :format => :long}, at #{event.venue.name}", event)
    end
    it "should display next meetup's date and TBA" do
      event = FactoryGirl.create(:event, :venue => nil)
      expect(helper.next_meetup(event)).to eq(link_to "#{l event.start_at.to_date, :format => :long}, venue TBA", event)
    end
  end

  context "#next_3rd_thurs" do
    it "should get third thursday of next month" do
      d = Date.new(2013, 3, 31)
      expect(helper.next_3rd_thurs(d)).to eq(Date.new(2013, 4, 18))
    end
    it "should get third thursday of next month even if first day is a Friday" do
      d = Date.new(2013, 10, 31)
      expect(helper.next_3rd_thurs(d)).to eq(Date.new(2013, 11, 21))
    end
    it "should get third thursday of next month even at the end of the year" do
      d = Date.new(2012, 12, 31)
      expect(helper.next_3rd_thurs(d)).to eq(Date.new(2013, 1, 17))
    end
    it "should get third thursday of this month if that date has not passed" do
      d = Date.new(2013, 4, 1)
      expect(helper.next_3rd_thurs(d)).to eq(Date.new(2013, 4, 18))
    end
  end
end
