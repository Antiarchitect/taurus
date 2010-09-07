class Admin < User
  devise :database_authenticatable, :rememberable, :trackable,
    :validatable

  def admin?
    true
  end
end
