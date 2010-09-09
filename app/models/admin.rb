class Admin < User
  devise :database_authenticatable, :rememberable, :trackable,
    :validatable
end
