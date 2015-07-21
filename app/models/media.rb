class Media < ActiveRecord::Base
  belongs_to :album
  validates :type, presence: true
  validates :file_name, presence: true
  validates :file_type, presence: true
  validates :url, presence: true
  validates :legal_release_info, presence: true
  validates :size, presence: true
  validates :width, presence: true
  validates :height, presence: true
  validates :uuid, uniqueness: true
  validates :s3_bucket_id, presence: true
  validates :xo_media_id, presence: true

  self.inheritance_column = :_type_disabled
end
