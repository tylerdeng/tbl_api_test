require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:address)).to be_valid
  end
  let(:address) { build(:address) }

  describe 'validations' do
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:address_line1) }
    it { should belong_to(:addressable) }

    its(:attributes) { should include('address_line2') }
    its(:attributes) { should include('city') }
    its(:attributes) { should include('country_code') }
    its(:attributes) { should include('state') }
    its(:attributes) { should include('zipcode') }
    its(:attributes) { should include('phone_number') }

    it { should have_db_column(:phone_number).of_type(:string) }
  end
end
