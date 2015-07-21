class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :type
      t.belongs_to :album, index: true

      t.timestamps null: false
    end
  end
end
