class Discipline < ActiveRecord::Base
  belongs_to :department
  has_many :charge_cards
end
