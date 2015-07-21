class Adduniqueindextouuids < ActiveRecord::Migration
  def change
    add_index :albums, :uuid, unique: true
    add_index :organizations, :uuid, unique: true
    add_index :publications, :uuid, unique: true
    add_index :events, :uuid, unique: true
    add_index :users, :uuid, unique: true

    add_column :media, :uuid, :uuid, default: 'uuid_generate_v4()'
    add_index :media, :uuid, unique: true
  end
end
