class Discipline < ActiveRecord::Base
  belongs_to :department
  has_many :charge_cards

  validates_presence_of :department, :name, :short_name
  validates_uniqueness_of :name, :scope => :department_id
  validates_length_of :short_name, :maximum => 24
end
