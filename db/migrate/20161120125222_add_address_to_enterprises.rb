class AddAddressToEnterprises < ActiveRecord::Migration[5.0]
  def change
    add_reference :enterprises, :headquarters, foreign_key: {to_table: :addresses}
  end
end
