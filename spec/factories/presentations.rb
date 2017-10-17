# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :presentation do
    sequence(:name) {|n| "Presentation #{n}" }
    description "MyText"
    event nil
    youtube "MyString"
    slideshare "MyString"
    speakerdeck "MyString"
  end
end
