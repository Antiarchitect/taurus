class Group < ActiveRecord::Base
  belongs_to :speciality
  has_many :jets, :dependent => :destroy
  has_many :charge_cards, :through => :jets

  validates_presence_of :name, :forming_year
  validates_format_of :forming_year, :with => /^(20)\d{2}$/,
    :message => '- допустимо вводить 4 числа, обозначающие год целиком.
Допустимы годы от 2000 до 2099'

  def course
    course = Time.now.year.to_i - self.forming_year
    if Time.now.month.to_i > 7
      course += 1
    end
    course
  end
end
