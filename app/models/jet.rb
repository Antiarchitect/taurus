class Jet < ActiveRecord::Base
  after_create :create_subgroups
  
  belongs_to :charge_card
  belongs_to :group
  has_many :subgroups, :dependent => :destroy

  validates_presence_of :group, :charge_card, :subgroups_quantity
  validates_numericality_of :subgroups_quantity
  validates_exclusion_of :subgroups_quantity, :in => 1..1

private

  def create_subgroups
    charge_card.pairs.each do |pair|
      subgroups.create(
        :pair_id => pair.id,
        :number => 0
      )
    end
  end
end