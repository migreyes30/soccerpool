# ITESM CEM, December 1, 2009.
# Ruby Source File
# Activity: Soccer Pool
# Authors:
# 967171 Maricela Obeso
# 466044 Miguel Ramirez

class Match < ActiveRecord::Base
  belongs_to :pool
  has_many :picks
  has_many :results
end
