class DctRecapitulation < ActiveRecord::Base
  self.primary_key = 'id'

  belongs_to  :dct_category
  belongs_to  :region

  delegate :name, :description, to: :dct_category, prefix: true
  delegate :name, to: :region, prefix: true
end
