class OrganizationAlbum < ActiveRecord::Base
  belongs_to :organization
  belongs_to :album
end
