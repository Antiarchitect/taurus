class DeptHead < User
  devise :database_authenticatable, :rememberable, :trackable,
    :validatable

  def department?
    true
  end
end
