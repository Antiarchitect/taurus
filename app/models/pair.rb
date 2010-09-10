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
      apart = full_lecturer.split(' ')
      name = apart[0]
      name += (' ' + apart[1].slice(/^./) + '.') if apart[1]
      name += (apart[2].slice(/^./) + '.') if apart[2]
    end
    name || ''
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
    unless charge_card.nil?
      charge_card.groups
    end
  end

  def lesson_type
    self.try(:charge_card).try(:lesson_type).try(:name)
  end
end
