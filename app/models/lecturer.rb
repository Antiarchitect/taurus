class Lecturer < ActiveRecord::Base
  has_many :teaching_places, :dependent => :destroy
  has_many :charge_cards, :through => :teaching_places
  has_many :departments, :through => :teaching_places
end
