class DeptHead::JetsController < DeptHead::BaseController
  active_scaffold do |config|
    config.columns = [:group, :subgroups_quantity]
    config.columns[:group].form_ui = :record_select
  end
end
