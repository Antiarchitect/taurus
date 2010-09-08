class Admin::SupervisorsController < Admin::BaseController
  active_scaffold :supervisor do |config|
    config.columns = [:name, :login, :email, :password, :password_confirmation]
  end
end
