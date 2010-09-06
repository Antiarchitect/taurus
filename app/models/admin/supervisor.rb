class Admin::Supervisor < User
  def supervisor?
    true
  end
end
