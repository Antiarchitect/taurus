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
      errors.add_to_base "Невозможно создать пару, так как следующая пара:<br /><br />" +
      pairs +
      "<br /><br />уже существует в этом временном окне этой аудитории."
    end
  end
  
  def validate_on_update
    conditions = ['pairs.id <> ? AND pairs.day_of_the_week = ? AND pairs.pair_number = ? AND pairs.week IN (?)',
                  id, day_of_the_week, pair_number, [0, week]]
    if (candidates = Pair.all(:conditions => conditions)).size > 0
      # classroom busyness
      if (conflicts = candidates.select { |c| c.classroom_id == classroom.id }).size > 0
        pairs = conflicts.map { |p| p.name }.join('<br />')
        errors.add_to_base "Невозможно сохранить пару, так как следующие пары:<br /><br />" +
        pairs +
        "<br /><br />уже существуют в этом временном окне этой аудитории."
        candidates -= conflicts 
      end
      # lecturer busyness
      if (conflicts = candidates.select { |c| c.charge_card && charge_card && c.charge_card.teaching_place.lecturer == charge_card.teaching_place.lecturer }).size > 0
        pairs = conflicts.map { |p| p.name }.join('<br />')
        errors.add_to_base "Невозможно сохранить пару, так как этот преподаватель уже ведет следующие пары:<br /><br />" +
        pairs +
        "<br /><br />в этом временном окне."
        candidates -= conflicts
      end
      # subgroups busyness
      if (conflicts = candidates.select { |c| c.charge_card && charge_card && (c.charge_card.groups & charge_card.groups).size > 0 }).size > 0
        groups_intersect = conflicts.map { |c| [c, c.charge_card.groups & charge_card.groups] }
        conflicts = []
        groups_intersect.each do |intersect|
          intersect[1].each do |group|
            pair = subgroups.select { |s| group.jets.map { |j| j.id }.include?(s.jet_id) }.first
            candidate = group.subgroups.find_by_pair_id(intersect[0].id)
            logger.info("pair.number: #{pair.number if pair}, candidate.number: #{candidate.number if candidate}")
            if pair && candidate && (pair.number == 0 || candidate.number == 0 || pair.number == candidate.number)
              logger.info("pair.number: #{pair.number}, candidate.number: #{candidate.number}")
              conflicts << intersect[0]
            end
          end
        end
        if conflicts.size > 0
          pairs = conflicts.map { |p| p.name }.join('<br />')
          errors.add_to_base "Невозможно сохранить пару, так как у одной или нескольких групп существуют следующие пары:<br /><br />" +
          pairs +
          "<br /><br />в этом временном окне."
          candidates -= conflicts
        end
      end
    end
  end
end
