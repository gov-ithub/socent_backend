class CreateEntrepreneurs < ActiveRecord::Migration[5.0]
  def change
    create_table :entrepreneurs do |t|
      t.string :identification_number
      t.string :name
      t.string :card_type
      t.string :card_series
      t.string :card_number
      t.string :issued_by
      t.date :issued_at
      t.string :designation
      t.text :proof_of_designation_url

      t.timestamps
    end
    add_index :entrepreneurs, :identification_number, unique: true
    add_index :entrepreneurs, :name
  end
end
