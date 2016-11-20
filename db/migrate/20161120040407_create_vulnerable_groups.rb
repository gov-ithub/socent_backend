class CreateVulnerableGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :vulnerable_groups do |t|
      t.string :description
      t.text :subgroups

      t.timestamps
    end
  end
end
