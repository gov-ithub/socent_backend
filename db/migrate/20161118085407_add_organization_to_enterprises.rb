class AddOrganizationToEnterprises < ActiveRecord::Migration[5.0]
  def change
    add_reference :enterprises, :organization, index: true, foreign_key: {to_table: :organizations}
  end
end
