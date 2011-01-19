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
      @days = Timetable.days
      @times = Timetable.times
      @weeks = Timetable.weeks
      @pairs = @group.get_pairs
    end
  end
end
