class Building < ActiveRecord::Base
  has_many :classrooms
  has_many :pairs, :through => :classrooms
end
