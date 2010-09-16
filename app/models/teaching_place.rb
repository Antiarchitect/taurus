class TeachingPlace < ActiveRecord::Base
  belongs_to :department
  belongs_to :lecturer
  belongs_to :position
  has_many :charge_cards, :dependent => :destroy

  validates_presence_of :department, :lecturer

  def name
    lecturer.name + ' (' + department.name + ')'
  end
end
