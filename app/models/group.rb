class Group < ActiveRecord::Base
  belongs_to :speciality
  has_many :jets, :dependent => :destroy
  has_many :charge_cards, :through => :jets
end
