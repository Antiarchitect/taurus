class Timetable::GroupsController < ApplicationController
  layout 'group'
  
  def index
    if params[:terminal]
      template = 'index_terminal'
    end
    
    group = params[:group].to_s.gsub('%', '\%').gsub('_', '\_') + '%'
    respond_to do |format|
      format.html { render template || 'index' }
      format.json { render :json => Group.all(:conditions => ['groups.name LIKE ?', group]).to_json(:only => [:id, :name]) }
    end    
  end
  
  def show
    if params[:terminal]
      @terminal = true
    end
    @id = params[:id].to_i
    unless @group = Group.find_by_id(@id, :include => { :jets => { :charge_card => { :pairs => :subgroups } } })
      suffix = @terminal ? '?terminal=true' : ''
      redirect_to :controller => 'timetable/groups' + suffix
    else
      jets = @group.jets
      charge_cards = @group.charge_cards
      pairs = charge_cards.map { |c| c.pairs }
      pairs = pairs.flatten
      @days = Timetable.days
      @times = Timetable.times
      @weeks = Timetable.weeks
      @pairs = Array.new(@days.size).map!{Array.new(@times.size).map!{Array.new(@weeks.size + 1).map!{Array.new}}}
      pairs.each do |pair|
        @pairs[pair.day_of_the_week - 1][pair.pair_number - 1][pair.week] << [pair, pair.subgroups.find_by_jet_id(jets.find_by_charge_card_id(pair.charge_card.id).id).try(:number)]
      end
    end
  end
end
