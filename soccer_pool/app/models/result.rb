# ITESM CEM, December 1, 2009.
# Ruby Source File
# Activity: Soccer Pool
# Authors:
# 967171 Maricela Obeso
# 466044 Miguel Ramirez

class Result < ActiveRecord::Base
	belongs_to :user
	belongs_to :pool
	belongs_to :match
end
