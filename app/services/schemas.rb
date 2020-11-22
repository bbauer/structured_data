class Schemas
  SCHEMAS_URL = 'https://schema.org/version/latest/schemaorg-current-http.jsonld'

  def fetch
    schemas['@graph'].each { |schema| create(schema) }
  end

  private

  def create(schema)
    Schema.create(name: name(schema['@id']),
                  comment: schema['rdfs:comment'],
                  url: schema['@id'])
  end

  def name(schema)
    schema.split('http://schema.org/').last
  end

  def schemas
    @schemas ||= JSON.parse(HTTParty.get(SCHEMAS_URL))
  end
end
