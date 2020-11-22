class CreateSchemas < ActiveRecord::Migration[6.0]
  def change
    create_table :schemas do |t|
      t.string :name
      t.string :url
      t.text :comment

      t.timestamps
    end
  end
end
