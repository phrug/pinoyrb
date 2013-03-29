# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :speaker do
    presentation nil
    user nil
    custom_bio "MyText"
  end
end
