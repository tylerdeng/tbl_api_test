FactoryGirl.define do
  factory :media do
    type 'Image'
    file_name 'image.jpg'
    file_type 'jpg'
    url { Faker::Internet.url }
    legal_release_info { Faker::Lorem.paragraph(2) }
    size 24.0
    width 100
    height 100
    uuid { SecureRandom.uuid }
    s3_bucket_id 's3folder'
    xo_media_id 'xofolder'
  end
end
