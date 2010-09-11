class DeptHead::TeachingPlacesController < DeptHead::BaseController
  active_scaffold do |config|
    config.columns = [:lecturer]
    config.columns[:lecturer].form_ui = :select
    config.nested.add_link('Карта распределения нагрузки', [:charge_cards])
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
