class Address < ActiveRecord::Base
  self.inheritance_column = :_type_disabled
  belongs_to :addressable, polymorphic: true
  validates :type, presence: true
  validates :address_line1, presence: true
end
