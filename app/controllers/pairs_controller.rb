class PairsController < ApplicationController
  def update
    if params[:classroom]
      Pair.update(params[:id],
        :classroom_id => params[:classroom]
      )
    end
    if params[:lecturer]
      Pair.update(params[:id],
        :classroom_id => params[:lecturer]
      )
    end
    if params[:group]
      Pair.update(params[:id],
        :classroom_id => params[:lecturer]
      )
    end
    Timeslot.update(Pair.find(params[:id]).timeslot.id,
      :week_number => params[:week],
      :week_day => params[:day],
      :pair_number => params[:time]
    )
    @classroom = Classroom.find(params[:classroom])
    @pairs = @classroom.pairs
    @pair = Pair.find(params[:id])
    @container = params[:container]
  end
end