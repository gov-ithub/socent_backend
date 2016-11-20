class AddAddressToEnterprises < ActiveRecord::Migration[5.0]
  def change
    add_reference :enterprises, :address, foreign_key: true
  end
end
