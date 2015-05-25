class Dpt < ActiveRecord::Base
  self.primary_key = 'id'

  belongs_to  :region

  delegate :name, to: :region, prefix: true
end
