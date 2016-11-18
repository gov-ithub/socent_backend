class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.column :password_hash, :binary, limit: 255
      t.column :password_salt, :binary, limit: 255
      t.references :organization, index: true, foreign_key: true

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
