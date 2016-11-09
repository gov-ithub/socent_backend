class CreateEnterpriseCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :enterprise_categories do |t|
      t.string :description

      t.timestamps
    end
  end
end
