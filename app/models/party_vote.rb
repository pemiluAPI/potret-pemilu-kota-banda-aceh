class PartyVote < ActiveRecord::Base
  self.primary_key = 'id'

  belongs_to  :party

  delegate :full_name, to: :party, prefix: true
end
