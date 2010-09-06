class Admin::AdminsController < ApplicationController
  active_scaffold Admin::Admin do |config|
    config.columns = [:name, :login, :email, :password, :password_confirmation]
  end
end
