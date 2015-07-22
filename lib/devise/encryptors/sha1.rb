require 'digest/sha1'
require 'devise-encryptable'
require 'devise'

module Devise
  module Encryptable
    module Encryptors
      class Sha1 < Base
        def self.digest(password, _stretches, salt, _pepper)
          str = [password, Rails.application.secrets.legacy_hash_token, salt].flatten.compact.join
          Digest::SHA1.hexdigest(str)
        end
      end
    end
  end
end
