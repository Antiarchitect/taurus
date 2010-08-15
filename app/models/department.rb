class Department < ActiveRecord::Base
  belongs_to :faculty
  has_many :classrooms
  has_many :disciplines
  has_many :teaching_places, :dependent => :destroy
  has_many :lecturers, :through => :teaching_places
  has_many :specialities
end
