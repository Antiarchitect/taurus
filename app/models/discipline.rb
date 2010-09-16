class Discipline < ActiveRecord::Base
  belongs_to :department
  has_many :charge_cards

  validates_presence_of :department, :name
  validates_uniqueness_of :name, :scope => [:department_id]
end
