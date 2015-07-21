class AddColumnToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :first_name, :string
    add_column :organizations, :last_name, :string
    add_column :organizations, :expiration_date, :integer
  end
end
