FactoryGirl.define do
  factory :organization do
    type 'Photographer'
    name { Faker::Company.name }
    uuid { SecureRandom.uuid }
    first_name 'first name'
    last_name 'last name'
    email 'test@test.com'
  end
end
