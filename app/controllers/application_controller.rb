# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  ActiveScaffold.set_defaults do |config|
    config.search.live = true
    config.ignore_columns = [:created_at, :updated_at, :lock_version]
    config.list.per_page = 30
    config.subform.layout = :vertical
  end
end
