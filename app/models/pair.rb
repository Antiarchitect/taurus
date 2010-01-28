class Pair < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :lecturer
  belongs_to :lesson
end
