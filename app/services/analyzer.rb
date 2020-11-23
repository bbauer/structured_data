class Analyzer
  SCRIPT_TYPE = 'script[type="application/ld+json"]'

  def initialize(url)
    @url       = url
    @mechanize = Mechanize.new
  end

  def run
    create_analysis
    create_schema_types
    @analysis
  end

  private

  def create_analysis
    @analysis = Analysis.create!(url: @url)
  end

  def create_schema_types
    @mechanize.get(@url).search(SCRIPT_TYPE).each do |schema|
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

  def process(schemas)
    schemas.each { |type| add_schema(type) }
  end

  def add_schema(schema)
    schema_id = get_schema_id(schema)
    new = @analysis.schema_types.create!(name: schema['@type'],
                                         schema_id: schema_id,
                                         fields: schema)
  end

  def get_schema_id(schema)
    schema = Schema.where(name: schema['@type']).first
    schema.id if schema.present?
  end
end
