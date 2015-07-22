FactoryGirl.define do
  factory :user do
    name 'Test User'
    email { Faker::Internet.email }
    password 'changeme'
    password_confirmation 'changeme'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now

    type 'Photographer'
    title { Faker::Name.title }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    uuid { SecureRandom.uuid }
  end
end
