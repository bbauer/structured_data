class Analyzer::Microdata
  SCRIPT_TYPE = '@itemtype'

  def initialize(page, analysis)
    @page = page
    @analysis = analysis
  end

  def run
    @page.search(SCRIPT_TYPE).each do |schema|
      add(schema)
    end
  end

  private

  def add(schema)
    name = schema.value.split('schema.org/').last
    schema_id = get_schema_id(name)

    @analysis.schema_types.create!(name: name,
                                   schema_id: schema_id,
                                   fields: schema.parent.to_s,
                                   strategy: 'microdata')
  rescue => e
  end

  def get_schema_id(name)
    schema = Schema.where(name: name).first
    schema.id if schema.present?
  end
end
