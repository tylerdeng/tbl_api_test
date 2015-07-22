require 'rails_helper'

RSpec.describe Subject, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:subject)).to be_valid
  end
  let(:subject) { FactoryGirl.build(:subject) }

  describe 'validations' do
    it { should validate_presence_of(:type) }
    # it { should validate_presence_of(:name) }
    it { should belong_to(:album) }
    it { should have_many(:addresses) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }

    it { should allow_value('dhh@nonopinionated.com').for(:email) }
    it { should_not allow_value('base@example').for(:email) }
    it { should_not allow_value('blah').for(:email) }

    its(:attributes) { should include('phone_number') }
    it { should respond_to(:name) }

    it 'should return the full name of the subject' do
      expect(subject.name).to eq "#{subject.first_name} #{subject.last_name}"
    end
  end
end
