module PairsHelper
  def options_for_association_conditions(association)
    if association.name == :classroom
      {'classrooms.building_id' => @record.building}
    else
      super
    end
  end
end