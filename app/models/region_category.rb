class RegionCategory < ActiveRecord::Base
  self.primary_key = 'id'

  has_many  :candidates
  has_many  :regions
end
