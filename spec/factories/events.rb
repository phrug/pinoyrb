FactoryGirl.define do
  factory :event do
    event_type "meetup"
    sequence(:name) {|n| "Event #{n}" }
    description "MyText"
    venue
    start_at "2013-03-31 15:44:46"
    end_at "2013-03-31 15:44:46"
  end
end
