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
    @classrooms = YAML.load(cookies[:classrooms_grids])

    respond_to do |format|
      format.js
    end
  end

  def create
    @days = self.class.days
    @times = self.class.times
    @weeks = self.class.weeks
    @classroom = Classroom.find_by_id(params[:classroom_id], :include => :pairs)
    unless @classroom
      flash[:error] = 'Нет аудитории с таким названием'
      redirect_to :action => :new
    else
      @pairs = @classroom.pairs
      grids = YAML.load(cookies[:classrooms_grids])
      grids << @classroom.id
      cookies[:classrooms_grids] = YAML.dump(grids)

      respond_to do |format|
        format.js
      end
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
end
