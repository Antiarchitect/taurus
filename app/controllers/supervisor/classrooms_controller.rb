class Supervisor::ClassroomsController < Supervisor::BaseController
  active_scaffold do |config|
    config.columns = [:building, :department, :name]
    config.columns[:building].form_ui = :select
    config.columns[:department].form_ui = :select
  end
end
