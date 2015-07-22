FactoryGirl.define do
  factory :event do
    type 'RealWedding'
    uuid { SecureRandom.uuid }
  end
end
