class Supervisor::LecturersController < Supervisor::BaseController
  active_scaffold do |config|
    config.columns = [:name]
  end
end
