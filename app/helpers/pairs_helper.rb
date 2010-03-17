module PairsHelper
  def building_form_column(record, input_name)
    select :record, :building, Building.all.map {|b| [ b.name, b.id ]}, {},
    javascript_for_update_column(active_scaffold_config.columns[:building], nil, :name => input_name)
  end
  
  def options_for_association_conditions(association)
    if association.name == :classroom
      {'classrooms.building_id' => @record.building}
    else
      super
    end
  end
end