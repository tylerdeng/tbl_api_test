require 'rails_helper'

RSpec.describe Subject, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:event)).to be_valid
  end
  let(:subject) { FactoryGirl.build(:event) }

  describe 'validations' do
    it { should validate_presence_of(:type) }
    it { should belong_to(:album) }
    it { should have_one(:address) }
    it { should validate_presence_of(:uuid) }
  end
end
