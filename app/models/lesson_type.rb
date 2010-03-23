class LessonType < ActiveRecord::Base
  has_many :charge_cards
end
