require 'rails_helper'

RSpec.describe Subject, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:user_authorization)).to be_valid
  end
  let(:subject) { FactoryGirl.build(:user_authorization) }

  it { should validate_presence_of(:type) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:token) }
  it { should have_db_column(:secret).of_type(:string) }
end
