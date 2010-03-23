class Pair < ActiveRecord::Base
  belongs_to :charge_card
  belongs_to :classroom
  belongs_to :timeslot

  def name
    unless (name = charge_card.try(:name)).nil?
      name
    else
      'Пара'
    end
  end

  def building
    @building || self.classroom.try(:building)
  end

  def building=(value)
    @building = Building.find_by_id(value)
  end
end
