require 'rails_helper'

RSpec.describe Publication, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:publication)).to be_valid
  end
  let(:subject) { FactoryGirl.build(:publication) }

  describe 'validations' do
    it { should validate_presence_of(:type) }
    it { should belong_to(:organization) }
    it { should have_many(:published_albums) }
    it { should have_many(:albums) }
    it { should validate_presence_of(:uuid) }
  end
end
