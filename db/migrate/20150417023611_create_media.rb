class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :type
      t.belongs_to :album, index: true

      t.timestamps null: false
    end
  end
end
