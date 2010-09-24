class ChargeCard < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :teaching_place
  
  # this needs to ActiveScaffold can display teaching place in charge cards for moving
  belongs_to :teaching_place_for_move, :class_name => 'TeachingPlace', :foreign_key => 'teaching_place_id'
  belongs_to :lesson_type
  has_many :jets, :dependent => :destroy
  has_many :groups, :through => :jets
  has_many :pairs

  validates_presence_of :discipline, :lesson_type, :teaching_place, :weeks_quantity, :hours_per_week
  validates_numericality_of :weeks_quantity, :hours_per_week

  def name
    groups = []
    self.groups.each do |group|
      groups << group.name
    end
    discipline.name + ', ' + lesson_type.name + ', ' + groups.map{|g| g + ', '}.to_s.chop.chop
  end

  def name_for_pair_edit
    teaching_place.name + ', ' + name
  end

  def hours_quantity
    weeks_quantity * hours_per_week
  end
end
