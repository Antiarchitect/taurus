class TeachingPlace < ActiveRecord::Base
  belongs_to :department
  belongs_to :lecturer
end
