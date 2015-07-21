class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :type
      t.belongs_to :organization, index: true

      t.timestamps null: false
    end
  end
end
