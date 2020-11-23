class Analysis < ApplicationRecord
  has_many :schema_types
  validates_presence_of :url

  def json_ld
    schema_types.json_ld
  end

  def microdata
    schema_types.microdata
  end

  def microdata_grouped
    microdata.all.group_by(&:name)
  end

  def rdfa
    schema_types.rdfa
  end
end
