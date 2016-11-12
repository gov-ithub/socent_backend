class CreateIndustryClassifications < ActiveRecord::Migration[5.0]
  def change
    create_table :industry_classifications do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
