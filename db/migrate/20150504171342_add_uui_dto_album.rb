class AddUuiDtoAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :uuid, :uuid, default: 'uuid_generate_v4()'
  end
end
