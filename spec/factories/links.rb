# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    url "MyString"
    link_type "MyString"
    linkable_type "MyString"
    linkable_id 1
  end
end
