class ChargeCard < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :teaching_place
  belongs_to :lesson_type
  has_many :jets, :dependent => :destroy
  has_many :groups, :through => :jets
  has_many :pairs

  def name
    groups = []
    self.groups.each do |group|
      groups << group.try(:name)
    end
    self.try(:discipline).try(:name) + ', ' + self.try(:lesson_type).try(:name) + ', ' + groups.map{|g| g + ', '}.to_s.chop.chop
  end
end
