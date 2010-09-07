class Supervisor < User
  devise :database_authenticatable, :rememberable, :trackable,
    :validatable
  
  def supervisor?
    true
  end
end
