class Analyzer::JsonLd
  SCRIPT_TYPE = 'script[type="application/ld+json"]'

  def initialize(page, analysis)
    @page = page
    @analysis = analysis
  end

  def run
    @page.search(SCRIPT_TYPE).each do |schema|
      schemas = JSON[schema]

      if schemas.kind_of?(Array)
        process(schemas)
      elsif schemas['@graph'].present?
        process(schemas['@graph'])
      else
        add_schema(schemas)
      end
    end
  end

  private

  def process(schemas)
    schemas.each { |type| add_schema(type) }
  end

  def add_schema(schema)
    schema_id = get_schema_id(schema)
    new = @analysis.schema_types.create!(name: schema['@type'],
                                         schema_id: schema_id,
                                         fields: schema,
                                         strategy: 'json')
  end

  def get_schema_id(schema)
    schema = Schema.where(name: schema['@type']).first
    schema.id if schema.present?
  end
end
