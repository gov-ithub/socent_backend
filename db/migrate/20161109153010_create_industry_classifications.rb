class CreateIndustryClassifications < ActiveRecord::Migration[5.0]
  def change
    create_table :industry_classifications, id: false do |t|
      t.primary_key :clasz, :string
      t.string :section, null: false
      t.string :division, null: false
      t.string :group, null: false
      t.string :description, null: false

      t.timestamps
    end

  end
end
