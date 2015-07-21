FactoryGirl.define do
  factory :address do
    address_line1 { Faker::Address.street_name }
    type 'Business'
  end
end
