class CreateUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :uploads do |t|
      t.text :path
      t.string :name

      t.timestamps
    end
  end
end
