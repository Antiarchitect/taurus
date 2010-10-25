class DeptHead::LecturersController < DeptHead::BaseController
  record_select :search_on => :name, :order_by => :name
  active_scaffold do |config|
    #config.actions = [:list, :create]
    config.columns = [:name]
  end
end
