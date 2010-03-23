class Jet < ActiveRecord::Base
  belongs_to :charge_card
  belongs_to :group
end
