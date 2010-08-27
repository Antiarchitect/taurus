class Pair < ActiveRecord::Base
  belongs_to :charge_card
  belongs_to :classroom
  has_many :subgroups, :dependent => :destroy

  accepts_nested_attributes_for :subgroups

  def name
    'Пара'
  end

  def full_lecturer
    self.try(:charge_card).try(:teaching_place).try(:name)
  end

  def lecturer
    unless full_lecturer.blank?
      full_lecturer.split(' ')[0]
    end
  end

  def full_discipline
    full = self.try(:charge_card).try(:discipline).try(:full_name)
    unless (lesson = self.try(:charge_card).try(:lesson_type).try(:name)).nil?
      full += ' (' + lesson + ')'
    end
  end

  def discipline
    self.try(:charge_card).try(:discipline).try(:name)
  end

  def groups
    groups_string = []
    unless (groups = self.try(:charge_card).try(:groups)).nil?
      groups.each do |group|
        groups_string << group.try(:name)
      end
    end
    groups_string.map{|g| g + ', '}.to_s.chop.chop
  end

  def lesson_type
    self.try(:charge_card).try(:lesson_type).try(:name)
  end
end
