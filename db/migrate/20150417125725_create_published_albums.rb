class CreatePublishedAlbums < ActiveRecord::Migration
  def change
    create_table :published_albums do |t|
      t.belongs_to :publication, index: true
      t.belongs_to :album, index: true

      t.timestamps null: false
    end
  end
end
