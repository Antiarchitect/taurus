class Subgroup < ActiveRecord::Base
  belongs_to :group
  belongs_to :pair

  validates_presence_of :group, :pair
end
