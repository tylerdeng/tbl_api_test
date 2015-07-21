class CreateUserAuthorizations < ActiveRecord::Migration
  def change
    create_table :user_authorizations do |t|
      t.string :type
      t.string :token
      t.string :secret

      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
