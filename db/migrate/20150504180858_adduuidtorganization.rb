class Adduuidtorganization < ActiveRecord::Migration
  def change
    add_column :organizations, :uuid, :uuid, default: 'uuid_generate_v4()'
  end
end
