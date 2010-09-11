class DeptHead::SpecialitiesController < DeptHead::BaseController
  active_scaffold do |config|
    config.columns = [:code, :name]
    config.nested.add_link('Группы', [:groups])
  end

  protected

  def before_create_save(record)
    if dept = current_dept_head.department
      record.department_id = dept.id
    end
  end

  def conditions_for_collection
    if dept = current_dept_head.department
      {:department_id => dept.id}
    else
      {:department_id => nil}
    end
  end
end
