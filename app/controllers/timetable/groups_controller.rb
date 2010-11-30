class Timetable::GroupsController < ApplicationController
  layout 'group'
  
  def index
    template = params[:terminal] ? 'index_terminal' : 'index'
    
    respond_to do |format|
      format.html { render template }
      format.json { render :json => Group.by_name(params[:group]).to_json(:only => [:id, :name]) }
    end    
  end
  
  def show
    @terminal = params[:terminal] ? true : false
    @id = params[:id].to_i
    unless @group = Group.for_timetable.find_by_id(@id)
      suffix = @terminal ? '?terminal=true' : ''
      redirect_to :controller => 'timetable/groups' + suffix
    else
      jets = @group.jets
      subgroups = jets.map { |j| j.subgroups }.flatten
      pairs = subgroups.map { |s| s.pair }
      @days = Timetable.days
      @times = Timetable.times
      @weeks = Timetable.weeks
      @pairs = Array.new(@days.size).map!{Array.new(@times.size).map!{Array.new(@weeks.size + 1).map!{Array.new}}}
      pairs.each do |pair|
        subgroup = subgroups.detect {|s| s.jet.charge_card_id == pair.charge_card_id}
        subgroups_number = subgroup.number if subgroup
        @pairs[pair.day_of_the_week - 1][pair.pair_number - 1][pair.week] << [pair, subgroups_number]
      end
    end
  end
end
