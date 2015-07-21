class AddColumnToMedia < ActiveRecord::Migration
  def change
    add_column :media, :s3_bucket_id, :string
    add_column :media, :xo_media_id, :string
  end
end
