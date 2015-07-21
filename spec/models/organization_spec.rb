require 'rails_helper'

RSpec.describe Organization, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:organization)).to be_valid
  end
  it 'has a scope include_addresses' do
    expect { Organization.include_addresses }.not_to raise_error
  end
  describe 'validations' do
    it { should validate_presence_of(:type) }
    it { should have_many(:addresses) }
    it { should have_many(:albums) }
    it { should have_many(:publications) }

    it { should have_many(:organization_albums) }
    it { should have_many(:albums) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:uuid) }
    # its(:attributes) { should include("import_id") }
    its(:attributes) { should include ('web_address') }
    its(:attributes) { should include ('user_status') }
    its(:attributes) { should include ('referral') }
    its(:attributes) { should include ('watermark_preference') }
    its(:attributes) { should include ('watermark_preference_vendor') }
    its(:attributes) { should include ('activated_date') }
    its(:attributes) { should include ('terms_conditions') }

    its(:attributes) { should include ('twitter_id') }
    its(:attributes) { should include ('facebook_id') }
    its(:attributes) { should include ('linkedin_id') }
    its(:attributes) { should include ('esty_id') }
    its(:attributes) { should include ('instagram_id') }
    its(:attributes) { should include ('flickr_id') }
    its(:attributes) { should include ('pinterest_id') }
    its(:attributes) { should include ('vimeo_id') }
    its(:attributes) { should include ('google_plus_id') }
    its(:attributes) { should include ('youtube_id') }
    its(:attributes) { should include ('tumblr_id') }
    its(:attributes) { should include ('blog') }
    its(:attributes) { should include ('established_when') }
    its(:attributes) { should include ('logo_required') }
    its(:attributes) { should include ('bio_description') }
    its(:attributes) { should include ('google_plus_id') }
    its(:attributes) { should include ('google_plus_id') }
  end
end
