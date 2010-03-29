class Pair < ActiveRecord::Base
  belongs_to :charge_card
  belongs_to :classroom
  belongs_to :timeslot

  def name
    'Пара'
  end

  def lecturer
    self.try(:charge_card).try(:lecturer).try(:name)
  end

  def discipline
    self.try(:charge_card).try(:discipline).try(:name)
  end
end
