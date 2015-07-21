class Subject < ActiveRecord::Base
  belongs_to :album
  has_many :addresses, as: :addressable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :type, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  self.inheritance_column = :_type_disabled

  def name
    "#{first_name} #{last_name}"
  end
end
