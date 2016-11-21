class CreateUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :uploads do |t|
      t.references :enterprise, null: false, foreign_key: true
      t.string :path, null: false, limit: 1024
      t.string :name, null: false

      t.timestamps
    end

    add_index :uploads, [:enterprise_id, :name], unique: true
  end
end
