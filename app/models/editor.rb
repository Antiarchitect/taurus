class Editor < User
  devise :database_authenticatable, :rememberable, :trackable,
    :validatable
end
