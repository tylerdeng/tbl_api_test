require 'rails_helper'

RSpec.describe PublishedAlbum, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:published_album)).to be_valid
  end
  let(:subject) { FactoryGirl.build(:published_album) }

  describe 'validations' do
    it { should belong_to(:publication) }
    it { should belong_to(:album) }
  end
end
