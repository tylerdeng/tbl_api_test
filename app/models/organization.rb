class Organization < ActiveRecord::Base
  has_many :addresses, as: :addressable
  has_many :publications
  has_many :organization_albums
  has_many :albums, through: :organization_albums
  has_many :users
  validates :type, presence: true
  validates :name, presence: true
  validates :uuid, presence: true, uniqueness: true
  self.inheritance_column = :_type_disabled
  scope :include_addresses, -> { includes(:addresses) }

  include RailsAdminDSL::Organization
end
