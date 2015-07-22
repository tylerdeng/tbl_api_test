require 'rails_helper'

RSpec.describe Organization, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:organization)).to be_valid
  end
  it 'has a scope include_addresses' do
    expect { Organization.include_associations }.not_to raise_error
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

    context '#established_years' do
      it 'should return an array' do
        expect(subject.established_years).to be_an(Array)
      end
      it 'should have an array as element' do
        expect(subject.established_years.first).to be_an(Array)
      end
      it 'should have the last value of [Pre-1980, 1970]' do
        expect(subject.established_years.last).to eq ['Pre-1980', 1970]
      end
      it 'should have the current year as its first value' do
        expect(subject.established_years.first).to eq [Time.now.year, Time.now.year]
      end
    end
    context '#last_active' do
      let(:user) { FactoryGirl.create(:user, last_sign_in_at: Time.zone.today) }
      before(:each) do
        subject.users << user
        subject.users << FactoryGirl.create(:user, last_sign_in_at: Time.zone.today - 1)
        subject.users << FactoryGirl.create(:user, last_sign_in_at: Time.zone.today - 2)
        subject.save
      end
      it 'should return the last sign in of the organization users' do
        expect(subject.last_active).to eq user.last_sign_in_at
      end
    end
    describe 'no assigned users' do
      context '#last_active' do
        it 'should return the minimal date as default' do
          expect(subject.last_active).to eq Date.new(1970, 1, 1)
        end
      end
    end
    context '#contact_name' do
      it 'should return the first and last name as string' do
        expect(subject.contact_name).to eq "#{subject.first_name} #{subject.last_name}"
      end
    end
    describe 'organization address' do
      let(:address) do
        FactoryGirl.create(:address, type: 'Business',
                                     city: 'Queens',
                                     state: 'NY')
      end
      before(:each) do
        subject.addresses << address
        subject.addresses << FactoryGirl.create(:address, type: 'Home',
                                                          city: 'Bronx',
                                                          state: 'NY')
      end
      context '#city' do
        it 'should return the city of the first address' do
          expect(subject.city).to eq address.city
        end
      end
      context '#state' do
        it 'should return the state of the first address' do
          expect(subject.state).to eq address.state
        end
      end
    end
  end
end
