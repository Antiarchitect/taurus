class Subgroup < ActiveRecord::Base
  belongs_to :jet
  belongs_to :pair

  validates_presence_of :group, :pair
end
