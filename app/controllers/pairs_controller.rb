class PairsController < ApplicationController
  def index

  end

  def show_classrooms_schedule
    @days = [
              'П о н е д е л ь н и к',
              'В т о р н и к',
              'С р е д а',
              'Ч е т в е р г',
              'П я т н и ц а',
              'С у б б о т а'
            ]
    @buildings = Building.all
    @classrooms = Classroom.all
  end

  def add_classroom
    @classroom = Classroom.first(:conditions => {:id => params[:classroom]})
  end

  def show_groups_schedule

  end

  def show_lecturers_schedule

  end
end
