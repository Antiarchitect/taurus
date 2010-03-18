class PairsController < ApplicationController
  active_scaffold do |config|
    config.columns[:classroom].form_ui = :select
    config.columns << :building
    config.columns[:building].options = {:update_column => :classroom}
  end

  def create
    @pair = Pair.new do |p|
      p.classroom_id = params[:classroom]
      p.group_id = params[:group]
      p.lecturer_id = params[:lecturer]
      timeslot = Timeslot.first(:conditions => {:week_number => params[:week],
        :week_day => params[:day], :pair_number => params[:time]})
      p.timeslot = timeslot
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
    pair = Pair.find_by_id(params[:id], :include => :timeslot)
    timeslot = pair.timeslot
    week_number = params[:week] || timeslot.week_number
    week_day = params[:day] || timeslot.week_day
    pair_number = params[:time] || timeslot.pair_number
    pair.timeslot = Timeslot.first(:conditions => {:week_number => week_number,
        :week_day => week_day, :pair_number => pair_number})
    pair.save!
    @pairs = @assoc.pairs
    @pair = Pair.find(params[:id])
    @container = params[:container]
  end

  def destroy
    @id = params[:id]
    pair = Pair.find_by_id(@id)
    pair.destroy
  end
end