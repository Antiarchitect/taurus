class Admin::EditorsController < Admin::BaseController
  active_scaffold :editor do |config|
    config.columns = [:name, :login, :email, :password, :password_confirmation]
  end
end
