FactoryGirl.define do
  factory :subject do
    type 'Couple'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
  end
end
