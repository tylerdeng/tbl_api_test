require 'rails_helper'

RSpec.describe Album, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:album)).to be_valid
  end
  let(:album) { build(:album) }

  describe 'validations' do
    it { should validate_presence_of(:story) }
    # it { should belong_to(:albumable) }
    it { should have_many(:subjects) }
    it { should have_many(:published_albums) }
    it { should have_many(:publications) }
    it { should have_many(:organization_albums) }
    it { should have_many(:organizations) }
    it { should have_one(:event) }
    it { should validate_presence_of(:uuid) }
  end
end
