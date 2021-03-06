class DeptHead::GroupsController < DeptHead::BaseController
  record_select :search_on => :name, :order_by => :name
  active_scaffold do |config|
    config.columns = [:name, :forming_year, :course]
    config.create.columns.exclude :course
    config.update.columns.exclude :course
  end
end
