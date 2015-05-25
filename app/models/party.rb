class Party < ActiveRecord::Base
  self.primary_key = 'id'

  has_many  :candidates
  has_many  :party_votes
end
