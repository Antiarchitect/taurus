class Pair < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :group
  belongs_to :lecturer
  belongs_to :lesson
  belongs_to :timeslot
end
