class Addnameandimportidtoorganization < ActiveRecord::Migration
  def change
    add_column :organizations, :name, :string
    add_column :organizations, :import_id, :string
    add_index :organizations, :import_id
  end
end
