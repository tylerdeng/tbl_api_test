class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :type
      t.string :name
      t.string :phone_number
      t.string :email

      t.belongs_to :album, index: true
      t.timestamps null: false
    end
  end
end
