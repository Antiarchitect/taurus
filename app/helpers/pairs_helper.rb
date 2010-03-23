module PairsHelper
  def faculty_form_column(record, input_name)
    select :record, :faculty, @record.faculty.map {|f| [ f.name, f.id ]}, {},
    javascript_for_update_column(active_scaffold_config.columns[:faculty], nil, active_scaffold_input_options(active_scaffold_config.columns[:faculty]))
  end

  def department_form_column(record, input_name)
    select :record, :department, @record.department.map {|d| [ d.name, d.id ]}, {},
    javascript_for_update_column(active_scaffold_config.columns[:department], nil, active_scaffold_input_options(active_scaffold_config.columns[:department]))
  end

  def options_for_association_conditions(association)
    if association.name == :department
      {'departments.faculty_id' => @record.faculty}
    else
      super
    end
  end
end