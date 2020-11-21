class CreateSchemaTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :schema_types do |t|
      t.integer :analysis_id
      t.string :name
      t.string :raw

      t.timestamps
    end
  end
end
