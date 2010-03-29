class TeachingPlace < ActiveRecord::Base
  belongs_to :department
  belongs_to :lecturer
  has_many :charge_cards
end
