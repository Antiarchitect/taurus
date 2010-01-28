class Lesson < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :lesson_type
end
