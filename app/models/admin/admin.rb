class Admin::Admin < User
  def admin?
    true
  end
end
