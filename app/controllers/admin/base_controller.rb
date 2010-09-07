class Admin::BaseController < ApplicationController
  before_filter :require_admin

  private

  def require_admin
    unless current_user.admin?
      redirect_to destroy_user_session_path
    end
  end
end
