class AddFieldsToSchemaType < ActiveRecord::Migration[6.0]
  def change
    add_column :schema_types, :fields, :json
  end
end
