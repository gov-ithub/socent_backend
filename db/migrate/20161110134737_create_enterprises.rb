class CreateEnterprises < ActiveRecord::Migration[5.0]
  def change
    create_table :enterprises do |t|
      t.string :number, null: false
      t.string :name, null: false
      t.string :tax_registration_code
      t.date :application_date, null: false
      t.date :founded_at
      t.string :primary_industry_classification_clasz
      t.string :secondary_industry_classifications, array: true
      t.references :social_intervention_domain, foreign_key: true
      t.references :enterprise_category, foreign_key: true
      t.string :contact_name
      t.references :entrepreneur, foreign_key: true
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_foreign_key :enterprises, :industry_classifications,
        column: :primary_industry_classification_clasz,
        primary_key: :clasz
    add_index :enterprises, :number, unique: true
    add_index :enterprises, :name
    add_index :enterprises, :tax_registration_code
  end
end
