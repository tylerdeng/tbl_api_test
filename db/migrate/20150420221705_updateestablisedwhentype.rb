class Updateestablisedwhentype < ActiveRecord::Migration
  def change
    remove_column :organizations, :established_when
    add_column :organizations, :established_when, :integer
  end
end
