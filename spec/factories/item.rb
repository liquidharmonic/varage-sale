FactoryGirl.define do
  factory :item do
    category
    seller 
    title {"my title"}
    description {"my item for sale"}
    price_in_cents {10000}
    status {"available"}
  end

  trait :banned do
    status {"banned"}
  end

  trait :sold do
    status {"sold"}
  end

  trait :available do
    status {"available"}
  end
end