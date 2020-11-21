class Analysis < ApplicationRecord
  has_many :schema_types
  validates_presence_of :url
end
