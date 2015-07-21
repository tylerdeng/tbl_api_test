class Addimediacolumns < ActiveRecord::Migration
  def change
    add_column :media, :file_name, :string
    add_column :media, :file_type, :string
    add_column :media, :url, :string
    add_column :media, :legal_release_info, :text
    add_column :media, :size, :float
    add_column :media, :width, :integer
    add_column :media, :height, :integer
    add_column :media, :caption, :string
    add_column :media, :credit, :string
  end
end
