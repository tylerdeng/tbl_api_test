class Publication < ActiveRecord::Base
  belongs_to :organization
  has_many :published_albums
  has_many :albums, through: :published_albums
  validates :type, presence: true
  validates :uuid, presence: true, uniqueness: true

  self.inheritance_column = :_type_disabled
end
