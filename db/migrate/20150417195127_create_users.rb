class CreateUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string
    add_column :users, :salt, :string
    add_column :users, :title, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_reference :users, :organization, index: true
  end
end
