class PairsController < ApplicationController
  def update
    if params[:classroom]
      Pair.update(params[:pair],
        :classroom_id => params[:classroom]
      )
    end
    if params[:lecturer]
      Pair.update(params[:pair],
        :classroom_id => params[:lecturer]
      )
    end
    if params[:group]
      Pair.update(params[:pair],
        :classroom_id => params[:lecturer]
      )
    end
    @days = ConstructorController.days
    @times = ConstructorController.times
    @weeks = ConstructorController.weeks
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
end