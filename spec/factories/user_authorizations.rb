FactoryGirl.define do
  factory :user_authorization do
    user { FactoryGirl.create :user }
    user_id { user.id }
    type { 'dropbox' }
    token { Faker::Bitcoin.address }
    secret { Faker::Bitcoin.address }
  end
end
