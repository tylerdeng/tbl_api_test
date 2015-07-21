class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :type
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :country_code
      t.string :state
      t.string :zipcode
      t.string :phone_number

      t.references :addressable, polymorphic: true, index: true
      t.timestamps null: false
    end

    add_column :organizations, :type, :string
  end
end
