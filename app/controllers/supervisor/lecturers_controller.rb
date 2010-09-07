class Supervisor::LecturersController < Supervisor::BaseController
  active_scaffold Lecturer do |config|
    config.columns = [:name]
  end
end
