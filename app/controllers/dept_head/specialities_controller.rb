class DeptHead::SpecialitiesController < DeptHead::BaseController
  active_scaffold do |config|
    config.columns = [:code, :name]
    config.nested.add_link('Группы', [:groups])
  end

  protected

  def before_create_save(record)
    record.department_id = current_dept_head.department.id
  end

  def conditions_for_collection
    {:department_id => current_dept_head.department.id}
  end
end
