class Pair < ActiveRecord::Base
  belongs_to :charge_card
  belongs_to :classroom
  belongs_to :timeslot

  def name
    'Пара'
  end
end
