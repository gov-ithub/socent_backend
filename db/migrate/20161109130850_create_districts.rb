class CreateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :districts, id: :string do |t|
      t.string :name

      t.timestamps
    end

    add_index :districts, :name, unique: true
  end
end
