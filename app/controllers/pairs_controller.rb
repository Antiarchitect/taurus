class PairsController < ApplicationController
  active_scaffold do |config|
    config.columns[:classroom].form_ui = :select
    config.columns[:building].form_ui = :select
    config.columns[:building].options = {:update_column => :classroom}
  end

  def create
    @pair = Pair.new do |p|
      p.classroom_id = params[:classroom]
      p.group_id = params[:group]
      p.lecturer_id = params[:lecturer]
      timeslot = Timeslot.new do |t|
        t.week_number = params[:week]
        t.week_day = params[:day]
        t.pair_number = params[:time]
      end
      p.timeslot = timeslot
      timeslot.save!
    end
    @pair.save!

    @container = params[:container]

#    respond_to do |format|
#      format.js { render :action => 'create.js' }
#    end
  end

  def update
    if params[:classroom]
      Pair.update(params[:id],
        :classroom_id => params[:classroom]
      )
      @assoc = Classroom.find(params[:classroom])
    end
    if params[:group]
      Pair.update(params[:id],
        :group_id => params[:group]
      )
      @assoc = Group.find(params[:group])
    end
    if params[:lecturer]
      Pair.update(params[:id],
        :lecturer_id => params[:lecturer]
      )
      @assoc = Lecturer.find(params[:lecturer])
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