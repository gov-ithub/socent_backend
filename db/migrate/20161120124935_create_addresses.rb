class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :district, foreign_key: true
      t.string :city
      t.string :address
      t.string :zipcode
      t.string :phone
      t.string :fax
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
