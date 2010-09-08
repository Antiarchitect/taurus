class Supervisor::DepartmentsController < Supervisor::BaseController
  active_scaffold do |config|
    config.columns = [:name, :full_name]
  end
end
