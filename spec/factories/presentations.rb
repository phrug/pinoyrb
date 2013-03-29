# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :presentation do
    name "MyString"
    slug "MyString"
    description "MyText"
    event nil
    youtube "MyString"
    slideshare "MyString"
    speakerdeck "MyString"
  end
end
