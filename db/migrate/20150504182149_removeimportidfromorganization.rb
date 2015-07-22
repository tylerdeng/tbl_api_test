class Removeimportidfromorganization < ActiveRecord::Migration
  def change
    remove_column :organizations, :import_id
  end
end
