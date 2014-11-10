class Publication < ActiveRecord::Base
  validates_presence_of :year
  validates_presence_of :citation
end
