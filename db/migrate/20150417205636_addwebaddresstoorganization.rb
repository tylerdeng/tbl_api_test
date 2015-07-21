class Addwebaddresstoorganization < ActiveRecord::Migration
  def change
    add_column :organizations, :web_address, :string
  end
end
