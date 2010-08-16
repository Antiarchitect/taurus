class Discipline < ActiveRecord::Base
  belongs_to :department
  has_many :charge_cards

  validates_presence_of :department, :name
end
