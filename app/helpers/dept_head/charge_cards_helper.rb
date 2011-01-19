module DeptHead::ChargeCardsHelper
  def options_for_association_conditions(association)
    case association.name
    when :teaching_place
      {'teaching_places.department_id' => current_dept_head.department.id}
    when :discipline
      {'disciplines.department_id' => current_dept_head.department.id}
    else
      super
    end
  end
end
