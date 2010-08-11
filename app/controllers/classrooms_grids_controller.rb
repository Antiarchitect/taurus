class ClassroomsGridsController < ApplicationController
  cattr_reader :days, :times, :weeks
  @@days = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота'
  ]
  @@times = [
    '08:15 - 09:45',
    '09:55 - 11:25',
    '11:35 - 13:05',
    '14:00 - 15:30',
    '15:40 - 17:10',
    '17:20 - 18:50',
    '19:00 - 20:30'
  ]
  @@weeks = [
    '1 неделя',
    '2 неделя'
  ]

# RESTful methods
  def index
    cookies[:classrooms_grids] = YAML.dump([0])
  end

  def show

  end

  def new
    @buildings = Building.all
    first_building_id = Building.first.id
    grids = YAML.load(cookies[:classrooms_grids])
    @classrooms = Classroom.all(:conditions => ["building_id = ? AND id NOT IN (?)", first_building_id, grids])

    respond_to do |format|
      format.js
    end
  end

  def create
    @days = self.class.days
    @times = self.class.times
    @weeks = self.class.weeks
    @classroom = Classroom.find(params[:classrooms_grid][:classroom], :include => :pairs)
    @pairs = @classroom.pairs
    grids = YAML.load(cookies[:classrooms_grids])
    grids << @classroom.id
    cookies[:classrooms_grids] = YAML.dump(grids)

    respond_to do |format|
      format.js
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @id = params[:id]
    grids = YAML.load(cookies[:classrooms_grids])
    grids.delete(@id.to_i)
    cookies[:classrooms_grids] = YAML.dump(grids)

    respond_to do |format|
      format.js
    end
  end

# Additional methods
  def update_classrooms_list
    grids = YAML.load(cookies[:classrooms_grids])
    @classrooms = Classroom.all(:conditions => ["building_id = ? AND id NOT IN (?)", params[:building], grids])
  end
end
