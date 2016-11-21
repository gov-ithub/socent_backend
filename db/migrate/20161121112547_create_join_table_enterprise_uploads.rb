class CreateJoinTableEnterpriseUploads < ActiveRecord::Migration[5.0]
  def change
    create_join_table :enterprises, :uploads do |t|
      # t.index [:enterprise_id, :upload_id]
      # t.index [:upload_id, :enterprise_id]
    end
  end
end
