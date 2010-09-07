class Supervisor::BaseController < ApplicationController
  before_filter :require_supervisor

  private

  def require_supervisor
    unless user_signed_in? && current_user.supervisor?
      redirect_to root_path
    end
  end
end
