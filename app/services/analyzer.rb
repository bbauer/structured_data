class Analyzer
  attr_reader :url, :mechanize

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
    @analysis = Analysis.create!(url: url)
  end

  def create_schema_types
    page.search('script[type="application/ld+json"]').each do |data_type|
      types = JSON[data_type]

      if types.kind_of?(Array)
        types.each do |type|
          if type.kind_of?(Array)
            type.each do |ty|
              add_type(ty)
            end
          else
            add_type(type)
          end
        end
      else
        add_type(types)
      end
    end
  end

  def add_type(type)
    @analysis.schema_types.create(name: type['@type'], fields: type)
  end

  def page
    @page ||= mechanize.get(url)
  end
end
