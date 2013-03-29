# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entity do
    entity_type "MyString"
    name "MyString"
    slug "MyString"
    description "MyText"
    venue nil
    recruiting false
    display false
  end
end
