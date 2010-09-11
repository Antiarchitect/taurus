class DeptHead < User
  belongs_to :department
  devise :database_authenticatable, :rememberable, :trackable,
    :validatable

  validates_presence_of :department
end
