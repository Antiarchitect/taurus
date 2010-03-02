class ClassroomsConstructorsController < ConstructorsController

  before_filter :set_grids

  # RESTful method
  def index
    
  end

  def show

  end

  def new
    @buildings = Building.all
    first_building_id = Building.first.id
    @classrooms = Classroom.all(:conditions => ["building_id = ? AND id NOT IN (?)", first_building_id, @@grids])
  end

  def create
    @days = self.class.days
    @times = self.class.times
    @weeks = self.class.weeks
    @classroom = Classroom.find(params[:classrooms_constructor][:classroom])
    @pairs = @classroom.pairs
    @@grids << @classroom.id
  end

  def edit

  end
  
  def update

  end

  def destroy
    
  end

# Additional methods
  def update_classrooms_list
    @classrooms = Classroom.all(:conditions => ["building_id = ? AND id NOT IN (?)", params[:building], @@grids])
  end

  protected

  def set_grids
    @@grids ||= [0]
  end
end