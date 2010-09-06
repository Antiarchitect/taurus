class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
    :validatable

  attr_accessible :login, :name, :email, :password, :password_confirmation

  def admin?
    false
  end

  def supervisor?
    false
  end

  def editor?
    false
  end

  def department?
    false
  end
end
