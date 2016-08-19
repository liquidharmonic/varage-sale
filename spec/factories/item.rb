FactoryGirl.define do
  factory :item do
    category
    seller 
    title {"my title"}
    description {"my item for sale"}
    price_in_cents {10000}
    status {"available"}
  end
end