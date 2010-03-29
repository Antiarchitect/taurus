class Lecturer < ActiveRecord::Base
  has_many :teaching_places, :dependent => :destroy
  has_many :charge_cards, :through => :teaching_places
  has_many :departments, :through => :teaching_places

  acts_as_chainable :from => :department, :to => :charge_card, :select_label => 'Преподаватель'
end
