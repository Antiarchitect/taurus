class Supervisor::BuildingsController < Supervisor::BaseController
  active_scaffold do |config|
    config.columns = [:name]
  end
end
