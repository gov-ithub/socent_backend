class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :district, foreign_key: true, type: :string
      t.string :city
      t.string :address
      t.string :zipcode
      t.string :phone
      t.string :fax
      t.string :email
      t.string :website

      t.belongs_to :headquarters_for_enterprise, foreign_key: { to_table: :enterprises }
      t.belongs_to :work_location_for_enterprise, foreign_key: { to_table: :enterprises }

      t.timestamps
    end
  end
end
