class Album < ActiveRecord::Base
  belongs_to :albumable, polymorphic: true
  has_many :published_albums
  has_many :publications, through: :published_albums
  has_many :organization_albums
  has_many :organizations, through: :organization_albums
  has_many :subjects
  has_many :media
  has_one :event
  validates :story, presence: true
  validates :uuid, presence: true, uniqueness: true
end
