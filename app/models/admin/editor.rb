class Admin::Editor < User
  def editor?
    true
  end
end
