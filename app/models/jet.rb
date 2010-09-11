class Jet < ActiveRecord::Base
  after_create :create_subgroups

  belongs_to :charge_card
  belongs_to :group
  has_many :subgroups, :dependent => :destroy

  private

  def create_subgroups
    card = self.charge_card
    pairs = card.pairs
    pairs.each do |pair|
      self.subgroups.create(
        :pair_id => pair.id
      )
    end
  end
end
