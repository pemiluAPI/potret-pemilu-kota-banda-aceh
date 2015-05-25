class Region < ActiveRecord::Base
  self.primary_key = 'id'

  belongs_to  :region_category

  delegate :name, :description, to: :region_category, prefix: true

  has_many  :dpts
  has_many  :dct_recapitulations
end
