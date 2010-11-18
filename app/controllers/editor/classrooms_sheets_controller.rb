class Editor::ClassroomsSheetsController < Editor::BaseController
  def new
    @classrooms_sheet = ClassroomsSheet.new
  end
  
  def create
    @weeks = Timetable.weeks
    @days = Timetable.days
    @times = Timetable.times
    @classrooms_sheet = ClassroomsSheet.new(params[:classrooms_sheet])
    @classrooms_sheet.classrooms = Classroom.all(:conditions => {:building_id => @classrooms_sheet.building.id}).sort_by { |c| c.name.to_i}
  end
end
