class Pair < ActiveRecord::Base
  belongs_to :building
  belongs_to :classroom
  belongs_to :group
  belongs_to :lecturer
  belongs_to :lesson
  belongs_to :timeslot

  def building_id
    classroom.building_id
  end
end
