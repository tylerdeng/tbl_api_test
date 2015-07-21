class CreateOrganizationAlbums < ActiveRecord::Migration
  def change
    remove_reference :albums, :albumable, polymorphic: true

    create_table :organization_albums do |t|
      t.belongs_to :organization, index: true
      t.belongs_to :album, index: true

      t.timestamps null: false
    end
  end
end
