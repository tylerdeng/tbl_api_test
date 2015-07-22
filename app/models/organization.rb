require 'date'
class Organization < ActiveRecord::Base
  has_many :addresses, as: :addressable
  has_many :publications
  has_many :organization_albums
  has_many :albums, through: :organization_albums
  has_many :users
  validates :type, presence: true
  validates :name, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true
  validates :uuid, presence: true, uniqueness: true
  self.inheritance_column = :_type_disabled
  scope :include_associations, -> { includes(:addresses, :users) }

  include RailsAdminDSL::Organization
  def last_active
    return Date.new(1970, 1, 1) unless users.present?
    users.to_a.map(&:last_sign_in_at).sort.last
  end

  def contact_name
    "#{first_name} #{last_name}"
  end

  def city
    "#{addresses.first.city}" if addresses.present?
  end

  def state
    "#{addresses.first.state}" if addresses.present?
  end

  def established_years
    year_array = 1980..Time.now.year
    year_array = year_array.to_a.reverse
    year_array << ['Pre-1980', 1970]
  end
end
