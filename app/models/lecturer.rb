class Lecturer < ActiveRecord::Base
  has_many :charge_cards
  has_many :teaching_places, :dependent => :destroy
  has_many :departments, :through => :teaching_places
end
