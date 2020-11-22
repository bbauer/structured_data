class AddSchemaIdToSchemaType < ActiveRecord::Migration[6.0]
  def change
    add_column :schema_types, :schema_id, :integer
  end
end
