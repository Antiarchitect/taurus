class Group < ActiveRecord::Base
  has_many :jets, :dependent => :destroy
  has_many :charge_cards, :through => :jets
end
