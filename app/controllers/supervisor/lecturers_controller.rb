class Supervisor::LecturersController < Supervisor::BaseController
  active_scaffold do |config|
    config.columns = [:name]
    config.list.sorting = { :name => :asc }
  end
end
