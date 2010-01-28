class Lecturer < ActiveRecord::Base
  has_many :lessons
end
