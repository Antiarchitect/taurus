class ClassroomsConstructorsController < ConstructorsController
# RESTful methods
  def after_initialize
    session.grids ||= [0]
  end
  def index
    
  end

  def show

  end

  def new
    @buildings = Building.all
    first_building_id = Building.first.id
    @classrooms = Classroom.all(:conditions => ["building_id = ? AND id NOT IN (?)", first_building_id, session.grids])
  end

  def create
    @days = self.class.days
    @times = self.class.times
    @weeks = self.class.weeks
    @classroom = Classroom.find(params[:classrooms_constructor][:classroom])
    @pairs = @classroom.pairs
    session.grids << @classroom.id
  end

  def edit

  end
  
  def update

  end

  def destroy
    
  end

# Additional methods
  def update_classrooms_list
    @classrooms = Classroom.all(:conditions => ["building_id = ? AND id NOT IN (?)", params[:building], session.grids])
  end
end