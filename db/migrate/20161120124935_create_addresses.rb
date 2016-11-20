class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street
      t.string :street_number
      t.string :phone
      t.string :fax
      t.string :email
      t.references :district, foreign_key: true

      t.timestamps
    end
  end
end
