class SchemaType < ApplicationRecord
  belongs_to :analysis
  belongs_to :schema

  validates_presence_of :analysis_id, :name, :strategy

  scope :json_ld, -> { where(strategy: 'json') }
  scope :microdata, -> { where(strategy: 'microdata') }
  scope :rdfa, -> { where(strategy: 'rdfa') }

  def associate
    return if schema_id.present?

    if schema = Schema.where(name: name).first
      update!(schema_id: schema.id)
    end
  end

  def pretty_fields
    HtmlBeautifier.beautify(fields)
  end
end
