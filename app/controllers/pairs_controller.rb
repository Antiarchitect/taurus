class PairsController < ApplicationController
  active_scaffold do |config|
    config.columns[:classroom].form_ui = :select
    config.columns[:building].form_ui = :select
    config.columns[:building].options = {:update_column => :classroom}
  end

  def create

  end

  def update
    if params[:classroom]
      Pair.update(params[:id],
        :classroom_id => params[:classroom]
      )
      @assoc = Classroom.find(params[:classroom])
    end
    if params[:lecturer]
      Pair.update(params[:id],
        :lecturer_id => params[:lecturer]
      )
      @assoc = Lecturer.find(params[:lecturer])
    end
    if params[:group]
      Pair.update(params[:id],
        :group_id => params[:group]
      )
      @assoc = Group.find(params[:group])
    end
    Timeslot.update(Pair.find(params[:id]).timeslot.id,
      :week_number => params[:week],
      :week_day => params[:day],
      :pair_number => params[:time]
    )
    @pairs = @assoc.pairs
    @pair = Pair.find(params[:id])
    @container = params[:container]
  end
end