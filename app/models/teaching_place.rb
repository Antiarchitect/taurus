class TeachingPlace < ActiveRecord::Base
  belongs_to :department
  belongs_to :lecturer
  has_many :charge_cards

  acts_as_chainable :from => :department, :to => :charge_card, :select_label => 'Преподаватель'

  def name
    lecturer.try(:name)
  end
end
