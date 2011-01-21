class Group < ActiveRecord::Base
  belongs_to :speciality
  has_many :jets, :dependent => :destroy
  has_many :subgroups, :through => :jets
  has_many :charge_cards, :through => :jets

  validates_presence_of :name, :forming_year
  validates_uniqueness_of :name, :scope => :forming_year
  validates_format_of :forming_year, :with => /^(20)\d{2}$/,
    :message => '- необходимо вводить год целиком. Допустимы годы от 2000 до 2099'

  named_scope :for_timetable, :include => [{:subgroups => [{:pair => [{:classroom => :building}, { :charge_card => [:discipline, {:teaching_place => [:lecturer, :department]}]}]}]}]
  named_scope :by_name, lambda { |name| { :conditions => ['groups.name LIKE ?', escape_name(name)] } }

  def course
    course = Time.now.year.to_i - forming_year
    if Time.now.month.to_i > 7
      course += 1
    end
    course
  end

  def get_pairs
    days = Timetable.days
    times = Timetable.times
    weeks = Timetable.weeks
    pairs_array = Array.new(days.size).map!{Array.new(times.size).map!{Array.new(weeks.size + 1).map!{Array.new}}}
    subgroups.each do |subgroup|
      pair = subgroup.pair
      pairs_array[pair.day_of_the_week - 1][pair.pair_number - 1][pair.week] << [pair, subgroup.number]
    end
    pairs_array
  end

  private

  def self.escape_name(name)
    name.to_s.gsub('%', '\%').gsub('_', '\_') + '%'
  end
end

