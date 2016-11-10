class CreateEnterprises < ActiveRecord::Migration[5.0]
  def change
    create_table :enterprises do |t|
      t.string :number
      t.string :name
      t.string :tax_registration_code
      t.date :founded_at
      t.references :primary_caen,
          foreign_key: {to_table: :caens}
      t.string :secondary_caens, array: true
      t.references :social_intervention_domain, foreign_key: true
      t.references :enterprise_category, foreign_key: true
      t.string :contact_name
      t.references :entrepreneur, foreign_key: true
      t.integer :status, null: false, default: 0

      t.timestamps
    end
    add_index :enterprises, :number, unique: true
    add_index :enterprises, :name
    add_index :enterprises, :tax_registration_code
  end
end
