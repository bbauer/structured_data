class Analyzer
  attr_reader :analysis, :url

  def initialize(url)
    @url       = url
    @mechanize = Mechanize.new
  end

  def run
    create_analysis
    Analyzer::JsonLd.new(page, analysis).run
    Analyzer::Microdata.new(page, analysis).run
    # Analyzer::Rdfa.new(page, @analysis).run
    analysis
  end

  protected

  def create_analysis
    @analysis = Analysis.create!(url: url)
  end

  def page
    @page ||= @mechanize.get(url)
  end
end
