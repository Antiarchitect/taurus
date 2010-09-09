class Supervisor < User
  devise :database_authenticatable, :rememberable, :trackable,
    :validatable
end
