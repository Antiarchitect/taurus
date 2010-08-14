class Classroom < ActiveRecord::Base
  has_many :pairs
  belongs_to :building
  belongs_to :department

  validates_presence_of :building
end
