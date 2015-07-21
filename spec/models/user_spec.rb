require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  describe 'validations' do
    it { should be_valid }
    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:title) }
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:auth_token) }

    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_salt) }
    it { should validate_presence_of(:uuid) }

    it { should validate_uniqueness_of(:email) }
    it { should validate_confirmation_of(:password) }
    it { should allow_value('example@domain.com').for(:email) }
    it { should validate_uniqueness_of(:auth_token) }
  end

  describe 'when email is not present' do
    before { subject.email = '' }
    it { should_not be_valid }
  end

  # spec/models/user_spec.rb
  describe 'devise valid_password?' do
    it 'should use our hashing mechanism' do
      user = FactoryGirl.create(:user)
      expect(user.valid_password?('changeme')).to be_truthy
    end

    it 'should allow validate existing users password' do
      user = User.find_by_email 'synthia_user@tbl_user.com'
      expect(user.valid_password?('moondance')).to be_truthy
    end

    it 'should not validate existing invalid users' do
      user = User.find_by_email 'synthia_user@tbl_user.com'
      expect(user.valid_password?('let-me-in')).to be_falsey
    end
  end

  describe '#vaidate_password' do
    it 'should return false if there is not an encrypted password' do
      user = FactoryGirl.create(:user)
      user.encrypted_password = ''
      user.save
      expect(user.valid_password?('let-me-in')).to be_falsey
    end
    context 'with created user' do
      before(:each) do
        @password = 'changeme'
        password_salt = 'this_is_salt'
        encrypted = Devise::Encryptable::Encryptors::Sha1.digest(@password, nil, password_salt, nil)

        @user = FactoryGirl.build(:user)
        @user.encrypted_password = encrypted
        @user.password_salt = password_salt
        @user.save
      end

      it 'should return true if the password and salt encode to the correct encrypted value' do
        expect(@user.valid_password?(@password)).to be_truthy
      end

      it 'should return false if the password and salt encode do not match the encrypted value' do
        expect(@user.valid_password?('let-me-in')).to be_falsey
      end
    end
  end

  describe '#generate_authentication_token!' do
    it 'generates a unique token' do
      expect(Devise).to receive(:friendly_token).and_return('an_unique_token123')
      @user.generate_authentication_token!
      expect(@user.auth_token).to eq 'an_unique_token123'
    end
    it 'generates another token when one already has been taken' do
      existing_user = FactoryGirl.create(:user, auth_token: 'an_unique_token123')
      @user.generate_authentication_token!
      expect(@user.auth_token).not_to eq existing_user.auth_token
    end
  end
end
