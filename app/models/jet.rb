class Jet < ActiveRecord::Base
  after_create :create_subgroups

  belongs_to :charge_card
  belongs_to :group
  has_many :subgroups, :dependent => :destroy

  private

  def create_subgroups(jet)
    card = jet.charge_card
    pairs = card.pairs
    pairs.each do |pair|
      jet.subgroups.create(
        :pair_id => pair.id
      )
    end
  end
end
