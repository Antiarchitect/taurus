class LessonType < ActiveRecord::Base
  has_many :charge_cards

  validates_presence_of :name
end
