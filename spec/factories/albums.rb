FactoryGirl.define do
  factory :album do
    story { Faker::Lorem.paragraph(2) }
    uuid { SecureRandom.uuid }
  end
end
