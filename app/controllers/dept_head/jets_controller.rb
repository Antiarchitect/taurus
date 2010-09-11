class DeptHead::JetsController < DeptHead::BaseController
  active_scaffold do |config|
    config.columns = [:group]
  end
end
