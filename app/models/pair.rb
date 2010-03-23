class Pair < ActiveRecord::Base
  belongs_to :charge_card
  belongs_to :classroom
  belongs_to :timeslot

  def name
    unless (name = charge_card.first.try(:name)).nil?
      name
    else
      'Пара'
    end
  end

  def faculty
    @faculty || Faculty.all
  end

  def faculty=(value)
    @faculty = Faculty.find_by_id(value)
  end

  def department
    @department || Department.all
  end

  def department=(value)
    @department = Department.find_by_id(value)
  end

  def lecturer
    @lecturer || Lecturer.all
  end

  def lecturer=(value)
    @lecturer = Lecturer.find_by_id(value)
  end

  def charge_card
    @charge_card || ChargeCard.all
  end

  def charge_card=(value)
    @charge_card = ChargeCard.find_by_id(value)
  end
end
