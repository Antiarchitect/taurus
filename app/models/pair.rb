class Pair < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :lecturer
  belongs_to :lesson
  belongs_to :timeslot
  has_many :jets, :dependent => :destroy
  has_many :groups, :through => :jets

  def building
    @building || self.classroom.try(:building)
  end

  def building=(value)
    @building = Building.find_by_id(value)
  end
end
