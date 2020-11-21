class AddUrlToAnalysis < ActiveRecord::Migration[6.0]
  def change
    add_column :analyses, :url, :string
  end
end
