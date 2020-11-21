class SchemaType < ApplicationRecord
  belongs_to :analysis
  validates_presence_of :analysis_id, :name
end
