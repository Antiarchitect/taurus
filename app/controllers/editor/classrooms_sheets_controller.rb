class Editor::ClassroomsSheetsController < Editor::BaseController
  def index
    @buildings = Building.all
  end
  
  def show
    @weeks = Timetable.weeks
    @days = Timetable.days
    @times = Timetable.times
    @building = Building.find_by_id(params[:id].to_i, :include => [{:classrooms => :pairs}])
    #@classrooms_sheet.classrooms = Classroom.all(:include => :pairs, :conditions => {:building_id => @classrooms_sheet.building.id}).sort_by { |c| c.name.to_i}
  end
end
