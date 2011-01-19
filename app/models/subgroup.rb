class Subgroup < ActiveRecord::Base
  belongs_to :jet
  belongs_to :pair

  validates_presence_of :jet, :pair
  validates_numericality_of :number
  validates_uniqueness_of :jet_id, :scope => :pair_id
end

