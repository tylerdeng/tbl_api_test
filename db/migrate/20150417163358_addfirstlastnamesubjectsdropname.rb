class Addfirstlastnamesubjectsdropname < ActiveRecord::Migration
  def change
    add_column :subjects, :first_name, :string
    add_column :subjects, :last_name, :string

    remove_column :subjects, :name, :string
  end
end
