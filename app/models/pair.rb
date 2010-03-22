class Pair < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :lecturer
  belongs_to :lesson
  belongs_to :timeslot
  has_many :jets, :dependent => :destroy
  has_many :groups, :through => :jets

  def name
    unless (discipline = lesson.try(:discipline).try(:name)).nil?
      lesson.try(:lesson_type).try(:name) || 'Пара' + ' по дисциплине: ' + discipline
    else
      lesson.try(:lesson_type).try(:name) || 'Пара'
    end
  end

  def building
    @building || self.classroom.try(:building)
  end

  def building=(value)
    @building = Building.find_by_id(value)
  end
end
