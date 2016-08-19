FactoryGirl.define do
  factory :seller do
    sequence(:name) { |n| "seller##{n}" }
    latitude 50
    longitude 50
  end
end