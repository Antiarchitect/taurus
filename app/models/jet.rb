class Jet < ActiveRecord::Base
  belongs_to :group
  belongs_to :pair
end
