class DctCategory < ActiveRecord::Base
  self.primary_key = 'id'

  has_many  :dct_recapitulations
end
