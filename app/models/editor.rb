class Editor < User
  devise :database_authenticatable, :rememberable, :trackable,
    :validatable

  def editor?
    true
  end
end
