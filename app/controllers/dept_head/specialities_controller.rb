class DeptHead::SpecialitiesController < DeptHead::BaseController
  active_scaffold do |config|
    config.columns = [:code, :name]
    config.nested.add_link('Группы', [:groups])
  end
end
