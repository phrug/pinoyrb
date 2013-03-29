# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    project_type "MyString"
    name "MyString"
    slug "MyString"
    description "MyText"
    website "MyString"
    source_code "MyString"
    pic "MyString"
  end
end
