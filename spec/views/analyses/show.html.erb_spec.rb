require 'rails_helper'

RSpec.describe "analyses/show", type: :view do
  before(:each) do
    @analysis = assign(:analysis, Analysis.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
