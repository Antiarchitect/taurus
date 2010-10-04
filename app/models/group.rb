class Group < ActiveRecord::Base
  belongs_to :speciality
  has_many :jets, :dependent => :destroy
  has_many :subgroups, :through => :jets
  has_many :charge_cards, :through => :jets

  validates_presence_of :name, :forming_year
  validates_uniqueness_of :name, :scope => :forming_year
  validates_format_of :forming_year, :with => /^(20)\d{2}$/,
    :message => '- необходимо вводить год целиком. Допустимы годы от 2000 до 2099'

  named_scope :for_timetable, :include => [ {:jets => [{:subgroups => { :pair => [ { :subgroups => :jet }, {:classroom => :building}, { :charge_card => [ :discipline, { :teaching_place => [:lecturer, :position, :department] } ] } ] } } ] } ]
  named_scope :by_name, lambda { |name| { :conditions => ['groups.name LIKE ?', escape_name(name)] } }

  def course
    course = Time.now.year.to_i - forming_year
    if Time.now.month.to_i > 7
      course += 1
    end
    course
  end

  private

  def self.escape_name(name)
    name.to_s.gsub('%', '\%').gsub('_', '\_') + '%'
  end
end
