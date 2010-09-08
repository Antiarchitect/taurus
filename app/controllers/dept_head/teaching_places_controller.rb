class DeptHead::TeachingPlacesController < DeptHead::BaseController
  active_scaffold do |config|
    config.columns = [:lecturer]
    config.columns[:lecturer].form_ui = :select
    config.nested.add_link('Карта распределения нагрузки', [:charge_cards])
  end

  protected

  def before_create_save(record)
    record.department_id = current_dept_head.department.id
  end

  def conditions_for_collection
    {:department_id => current_dept_head.department.id}
  end
end
