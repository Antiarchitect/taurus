class Classroom < ActiveRecord::Base
  has_many :pairs
  belongs_to :building
  belongs_to :department
end
