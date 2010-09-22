class Jet < ActiveRecord::Base
  after_create :create_subgroups

  belongs_to :charge_card
  belongs_to :group
  has_many :subgroups, :dependent => :destroy

  validates_presence_of :group, :charge_card
  validates_numericality_of :subgroups_quantity
  validates_exclusion_of :subgroups_quantity, :in => 1..1

private

  def create_subgroups
    card = self.charge_card
    pairs = card.pairs
    pairs.each do |pair|
      self.subgroups.create(
        :pair_id => pair.id,
        :number => 0
      )
    end
  end
end
