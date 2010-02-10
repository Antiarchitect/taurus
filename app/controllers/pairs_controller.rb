class PairsController < ApplicationController
  @@days = [
              'П о н е д е л ь н и к',
              'В т о р н и к',
              'С р е д а',
              'Ч е т в е р г',
              'П я т н и ц а',
              'С у б б о т а'
            ]
  @@pair_times = [
                    '08:15 - 09:45',
                    '09:55 - 11:25',
                    '11:35 - 13:05',
                    '14:00 - 15:30',
                    '15:40 - 17:10',
                    '17:20 - 18:50',
                    '19:00 - 20:30'
                 ]
  def index

  end

  def savestate
    pair = Pair.first(params[:pair])
    pair.classroom_id = params[:classroom]
    timeslot = pair.timeslot
    timeslot.week_number = params[:week]
    timeslot.week_day = params[:day]
    timeslot.pair_number = params[:pairtime]
  end

  def show_classrooms_schedule
    @days = @@days
    @buildings = Building.all
    @classrooms = Classroom.all(:conditions => {:building_id => 1})
  end

  def show_classroom_form

  end

  def hide_classroom_form

  end
  
  def update_classrooms
    @classrooms = Classroom.all(:conditions => {:building_id => params[:building]})
  end

  def add_classroom
    @days = @@days
    @pair_times = @@pair_times
    @classroom = Classroom.first(:conditions => {:id => params[:pairs][:classroom]})
  end

  def delete_classroom
    @id = params[:id]
  end

  def show_groups_schedule

  end

  def show_lecturers_schedule

  end
end
