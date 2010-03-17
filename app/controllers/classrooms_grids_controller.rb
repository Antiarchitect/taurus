class ClassroomsGridsController < GridsController
# RESTful methods
  def index
    cookies[:classrooms_grids] = [0].to_yaml
  end

  def show

  end

  def new
    @buildings = Building.all
    first_building_id = Building.first.id
    grids = cookies[:classrooms_grids]
    @classrooms = Classroom.all(:conditions => ["building_id = ? AND id NOT IN (?)", first_building_id, grids])
  end

  def create
    @days = self.class.days
    @times = self.class.times
    @weeks = self.class.weeks
    @classroom = Classroom.find(params[:classrooms_grid][:classroom], :include => [{:pairs, :timeslot}])
    @pairs = @classroom.pairs
    grids = cookies[:classrooms_grids]
    grids << @classroom.id
    cookies[:classrooms_grids] = grids.to_yaml
  end

  def edit

  end

  def update

  end

  def destroy
    @id = params[:id]
    grids = cookies[:classrooms_grids]
    grids.delete(@id.to_i)
    cookies[:classrooms_grids] = grids
  end

# Additional methods
  def update_classrooms_list
    grids = cookies[:classrooms_grids]
    @classrooms = Classroom.all(:conditions => ["building_id = ? AND id NOT IN (?)", params[:building], grids])
  end
end
