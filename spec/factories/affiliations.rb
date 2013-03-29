# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :affiliation do
    entity nil
    user nil
    position "MyString"
    current false
  end
end
