class AddStrategyToSchemaType < ActiveRecord::Migration[6.0]
  def change
    add_column :schema_types, :strategy, :string
  end
end
