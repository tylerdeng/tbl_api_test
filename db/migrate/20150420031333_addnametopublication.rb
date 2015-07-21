class Addnametopublication < ActiveRecord::Migration
  def change
    add_column :publications, :name, :string
  end
end
