class ChargeCard < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :lecturer
  belongs_to :lesson_type
  has_many :jets, :dependent => :destroy
  has_many :groups, :through => :jets
  has_many :pairs

  acts_as_chainable :from => :department, :select_label => 'Запись в карте'

  def name
    'Карта'
  end
end
