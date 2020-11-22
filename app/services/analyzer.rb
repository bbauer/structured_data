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
        schemas.each { |type| add_schema(type) }
      else
        add_schema(schemas)
      end
    end
  end

  def add_schema(schema)
    new = @analysis.schema_types.create(name: schema['@type'], fields: schema)
    new.associate
  end
end
