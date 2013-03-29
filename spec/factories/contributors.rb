# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contributor do
    contributor_id 1
    contributor_type "MyString"
    project nil
    role "MyString"
    current false
  end
end
