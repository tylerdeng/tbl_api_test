require 'rails_helper'

RSpec.describe Media, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:media)).to be_valid
  end
  let(:subject) { FactoryGirl.build(:media) }

  describe 'validations' do
    it { should validate_presence_of(:type) }
    it { should belong_to(:album) }
    it { should validate_presence_of(:file_name) }
    it { should validate_presence_of(:file_type) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:legal_release_info) }
    it { should validate_presence_of(:size) }
    it { should validate_presence_of(:width) }
    it { should validate_presence_of(:height) }
    it { should validate_presence_of(:s3_bucket_id) }
    it { should validate_presence_of(:xo_media_id) }

    it { should have_db_column(:caption).of_type(:string) }
    it { should have_db_column(:credit).of_type(:string) }
    it { should have_db_column(:s3_bucket_id).of_type(:string) }
    it { should have_db_column(:xo_media_id).of_type(:string) }
  end
end
