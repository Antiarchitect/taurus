class TeachingPlace < ActiveRecord::Base
  belongs_to :department
  belongs_to :lecturer
  has_many :charge_cards, :dependent => :destroy

  def name
    lecturer.try(:name)
  end
end
