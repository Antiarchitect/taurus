class DeptHead < User
  belongs_to :department
  devise :database_authenticatable, :rememberable, :trackable,
    :validatable

  def department?
    true
  end
end
