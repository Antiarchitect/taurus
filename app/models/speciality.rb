class Speciality < ActiveRecord::Base
  belongs_to :department
  has_many :groups
end
