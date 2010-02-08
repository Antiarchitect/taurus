class Classroom < ActiveRecord::Base
  has_many :pairs
  belongs_to :building
end
