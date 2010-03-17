class PairsController < ApplicationController
  before_filter :update_pair_config

  active_scaffold
  
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
    @pov = params[:pov]
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

  def destroy
    @id = params[:id]
    pair = Pair.find_by_id(@id)
    pair.timeslot.destroy
    pair.destroy
  end

  protected

  def update_pair_config
    unless (params[:pov].nil?)
      case params[:pov]
      when 'classroom'
        active_scaffold_config.columns = [:building, :classroom]
        active_scaffold_config.columns[:classroom].form_ui = :select
        active_scaffold_config.columns[:building].options = {:update_column => :classroom}
      when 'group'

      when 'lecturer'
      end
    end
  end
end