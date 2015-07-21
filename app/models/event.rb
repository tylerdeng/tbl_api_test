class Event < ActiveRecord::Base
  belongs_to :album
  has_one :address, as: :addressable
  validates :type, presence: true
  validates :uuid, presence: true, uniqueness: true

  self.inheritance_column = :_type_disabled
end
