FactoryGirl.define do
  factory :organization do
    type 'Photographer'
    name { Faker::Company.name }
    uuid { SecureRandom.uuid }
  end
end
