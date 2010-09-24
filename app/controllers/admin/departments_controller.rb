class Admin::DepartmentsController < Admin::BaseController
  record_select :search_on => :name, :order_by => :name
  active_scaffold do |config|
    config.columns = [:name, :short_name]
  end
end
