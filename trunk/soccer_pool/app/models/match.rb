class Match < ActiveRecord::Base
  belongs_to :pool
  has_many :picks
  has_many :results
end
