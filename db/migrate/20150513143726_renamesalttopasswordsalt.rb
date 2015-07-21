class Renamesalttopasswordsalt < ActiveRecord::Migration
  def change
    rename_column :users, :salt, :password_salt
  end
end
