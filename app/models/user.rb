class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable,
    :validatable

  attr_accessible :login, :name, :email, :password, :password_confirmation

  protected
   def password_required?
     new_record? || destroyed? || password.present? || password_confirmation.present?
   end
end
