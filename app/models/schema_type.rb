class SchemaType < ApplicationRecord
  belongs_to :analysis
  belongs_to :schema

  validates_presence_of :analysis_id, :name

  def associate
    return if schema_id.present?

    if schema = Schema.where(name: name).first
      update(schema_id: schema.id)
    end
  end
end
