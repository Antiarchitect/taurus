class ChargeCard < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :lecturer
  belongs_to :lesson_type
  has_many :jets, :dependent => :destroy
  has_many :groups, :through => :jets
  has_many :pairs

  def name
    'Карта'
  end
end
