require Rails.root.join('lib', 'devise', 'encryptors', 'sha1')

class User < ActiveRecord::Base
  before_create :generate_authentication_token!

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :encryptable, encryptor: :sha1

  validates :type, presence: true
  validates :password_salt, presence: true
  validates :uuid, presence: true, uniqueness: true
  validates :auth_token, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  belongs_to :organization
  has_many :user_authorizations

  groupify :group_member
  groupify :named_group_member

  self.inheritance_column = :_type_disabled

  def valid_password?(password)
    return false if encrypted_password.blank?
    Devise.secure_compare(Devise::Encryptable::Encryptors::Sha1.digest(password, nil, password_salt, nil), encrypted_password)
  end

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
