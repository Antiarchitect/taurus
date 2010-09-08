class DeptHead::GroupsController < DeptHead::BaseController
  active_scaffold do |config|
    config.columns = [:name, :forming_year, :course]
    config.create.columns.exclude :course
    config.update.columns.exclude :course
  end
end
