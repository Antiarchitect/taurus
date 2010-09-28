class Pair < ActiveRecord::Base
  belongs_to :charge_card
  belongs_to :classroom
  has_many :subgroups, :dependent => :destroy

  accepts_nested_attributes_for :subgroups

  def name
    [lecturer, full_discipline, 'ауд: ' + classroom.full_name, timeslot, groups_string].select{ |e| e != ''}.join(', ')
  end

  def timeslot
    str = [Timetable.days[day_of_the_week - 1], pair_number.to_s + '-я пара', week_string].join(', ')
    str == '' ? '' : 'окно: ' + str
  end
  
  def week_string
    week == 0 ? '' : week.to_s + '-я неделя'
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
    self.try(:charge_card).try(:teaching_place).try(:lecturer).try(:id) || nil
  end

  def full_discipline
    full = self.try(:charge_card).try(:discipline).try(:name)
    unless (lesson = self.try(:charge_card).try(:lesson_type).try(:name)).nil?
      full += ' (' + lesson + ')'
    end
    full || ''
  end

  def discipline
    self.try(:charge_card).try(:discipline).try(:name)
  end

  def short_discipline
    self.try(:charge_card).try(:discipline).try(:short_name)
  end

  def groups
    unless charge_card.nil?
      groups = charge_card.groups
    end
    groups || []
  end
  
  def groups_string
    g = groups.map do |g|
      name = g.name.to_s 
      if (number = g.subgroups.find_by_pair_id(id).number) == 0
        subgroup = ''
      else
        subgroup = ' (' + number.to_s + '-я подгруппа)'
      end
      name + subgroup
    end
    g.join(', ') == '' ? '' : 'группы: ' + g.join(', ')
  end

  def lesson_type
    self.try(:charge_card).try(:lesson_type).try(:name)
  end
  
  private
  
  def validate_on_create
    conditions = { :classroom_id => classroom_id,
                   :day_of_the_week => day_of_the_week,
                   :pair_number => pair_number,
                   :week => [ 0, week ] }
    if (conflicts = Pair.all(:conditions => conditions)).size > 0
      pairs = conflicts.map { |p| p.name }.join('<br />')
      logger.info(pairs)
      errors.add_to_base "Невозможно создать пару, так как следующие пары:<br /><br />" +
      pairs +
      "<br /><br />уже существуют в этом временном окне этой аудитории."
    end
  end
end
