require 'rails_helper'

describe Devise::Encryptable::Encryptors::Sha1 do
  context '#digest' do
    it 'should call sha1 digest with correctly build token' do
      password = 'password'
      salt = 'this+is+my+salt'

      expect(Digest::SHA1).to receive(:hexdigest).with(password + Rails.application.secrets.legacy_hash_token + salt)
      Devise::Encryptable::Encryptors::Sha1.digest password, nil, salt, nil
    end
  end
end
