class DeptHead::TeachingPlacesController < DeptHead::BaseController
  active_scaffold do |config|
    config.columns = [:lecturer, :position]
    config.columns[:lecturer].form_ui = :record_select
    config.columns[:position].form_ui = :select
    config.columns[:lecturer].sort_by :sql => 'lecturers.name'
    config.search.columns = :lecturer
    config.columns[:lecturer].search_sql = 'lecturers.name'
    config.nested.add_link('Карта распределения нагрузки', [:charge_cards])
  end

  protected

  def before_create_save(record)
    @dept ||= current_dept_head.department
    record.department_id = @dept.id
  end

  def conditions_for_collection
    @dept ||= current_dept_head.department
    {:department_id => @dept.id}
  end
end
