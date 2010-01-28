class Lesson < ActiveRecord::Base
  belongs_to :discipline
  belings_to :lecturer
  belongs_to :lesson_type
end
