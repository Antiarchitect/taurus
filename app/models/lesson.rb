class Lesson < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :lesson_type
  has_many :pairs
end
