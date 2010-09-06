class Admin::AdminsController < Admin::BaseController
  active_scaffold :admin do |config|
    config.columns = [:name, :login, :email, :password, :password_confirmation]
  end
end
