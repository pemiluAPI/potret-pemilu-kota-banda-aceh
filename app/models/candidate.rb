class Candidate < ActiveRecord::Base
  self.primary_key = 'id'

  belongs_to  :party
  belongs_to  :region_category

  delegate :full_name, to: :party, prefix: true
  delegate :name, :description, to: :region_category, prefix: true
end
