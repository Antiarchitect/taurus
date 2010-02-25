class ClassroomsConstructorsController < ConstructorsController
  def show
    first_building_id = Building.first.id
    @classrooms = Classroom.all(:conditions => {:building_id => first_building_id})
  end

  def update_classrooms
    
  end
end