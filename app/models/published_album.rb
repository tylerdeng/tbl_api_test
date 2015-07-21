class PublishedAlbum < ActiveRecord::Base
  belongs_to :publication
  belongs_to :album
end
