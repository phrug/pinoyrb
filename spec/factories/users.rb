# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "John Doe"
    sequence(:email) {|n| "email#{n}@factory.com" }
    password "12345678"
    password_confirmation { |u| u.password }
  end
end
