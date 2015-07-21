FactoryGirl.define do
  factory :publication do
    type 'Web'
    name { Faker::Commerce.department }
    uuid { SecureRandom.uuid }
  end
end
