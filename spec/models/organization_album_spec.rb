require 'rails_helper'

RSpec.describe OrganizationAlbum, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:organization_album)).to be_valid
  end
  let(:subject) { FactoryGirl.build(:organization_album) }

  describe 'validations' do
    it { should belong_to(:organization) }
    it { should belong_to(:album) }
  end
end
