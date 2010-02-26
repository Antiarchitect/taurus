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
    @days = self.class.days
    @times = self.class.times
    @weeks = self.class.weeks
    Pair.update(params[:pair],
      :classroom_id => params[:grid]
    )
    Timeslot.update(Pair.find(params[:pair]).timeslot.id,
      :week_number => params[:week],
      :week_day => params[:day],
      :pair_number => params[:time]
    )
    @classroom = Classroom.first(:conditions => {:id => params[:grid]})
    @pairs = @classroom.pairs
    @pair = Pair.find(params[:pair])
    @container = params[:container]
  end

  def update_classrooms_list
    @classrooms = Classroom.all(:conditions => {:building_id => params[:building]})
  end

  def hide_form
    
  end
end