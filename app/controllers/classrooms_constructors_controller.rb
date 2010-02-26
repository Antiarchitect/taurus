class ClassroomsConstructorsController < ConstructorsController
  def index
    
  end

  def new
    @buildings = Building.all
    first_building_id = Building.first.id
    @classrooms = Classroom.all(:conditions => {:building_id => first_building_id})
  end

  def destroy
    
  end

  def create
    @classroom = Classroom.find(params[:classrooms_constructors][:classroom])
    @pairs = @classroom.pairs
    @days = self.class.days
    @times = self.class.times
    @weeks = self.class.weeks
  end

  def update
    
  end

  def update_classrooms_list
    @classrooms = Classroom.all(:conditions => {:building_id => params[:building]})
  end

  def hide_form
    
  end
end