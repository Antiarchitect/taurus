class ClassroomsConstructorsController < ConstructorsController
# RESTful methods
  def index
    
  end

  def show

  end

  def new
    @buildings = Building.all
    first_building_id = Building.first.id
    @classrooms = Classroom.all(:conditions => {:building_id => first_building_id})
  end

  def create
    @days = self.class.days
    @times = self.class.times
    @weeks = self.class.weeks
    @classroom = Classroom.find(params[:classrooms_constructor][:classroom])
    @pairs = @classroom.pairs
  end

  def edit

  end
  
  def update

  end

  def destroy
    
  end

# Additional methods
  def update_classrooms_list
    @classrooms = Classroom.all(:conditions => {:building_id => params[:building]})
  end
end