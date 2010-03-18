class PairsController < ApplicationController
  before_filter :pov
  active_scaffold
  
  def edit_from_classrooms
    @record = find_if_allowed(params[:id], :update)
    respond_to_action(:edit)
  end

  def edit_from_groups

  end

  def edit_from_lecturers

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
    @pov = params[:pov]
  end

  def update_on_drop
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

  def pov
    active_scaffold_config.columns = [:building, :classroom, :lecturer, :group]
    active_scaffold_config.columns[:classroom].form_ui = :select
    active_scaffold_config.columns[:lecturer].form_ui = :select
    case params[:action]
    when 'edit_from_classrooms'
      active_scaffold_config.update.columns = [:lecturer]
    when 'edit'
      active_scaffold_config.update.columns = [:building, :classroom]
      active_scaffold_config.columns[:building].options = {:update_column => :classroom}
    end
  end
end