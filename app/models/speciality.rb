class Speciality < ActiveRecord::Base
  belongs_to :department
  has_many :groups

  def name
    self.code + ' - ' + self.name
  end
end
