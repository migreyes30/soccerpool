class Pool < ActiveRecord::Base
  has_many :matches
  has_many :results
end
