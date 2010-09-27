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

  def lecturer_id
    self.try(:charge_card).try(:teaching_place).try(:lecturer).try(:id)
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

  def short_discipline
    self.try(:charge_card).try(:discipline).try(:short_name)
  end

  def groups
    unless charge_card.nil?
      charge_card.groups
    end
  end

  def lesson_type
    self.try(:charge_card).try(:lesson_type).try(:name)
  end
  
  def self.find_candidates(pair)
    candidates = Pair.all(:conditions => {:classroom_id => pair.classroom_id, :day_of_the_week => pair.day_of_the_week, :pair_number => pair.pair_number }).to_a
  end
end
