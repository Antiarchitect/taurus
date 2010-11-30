class Timetable::LecturersController < ApplicationController

  def index
    if params[:terminal]
      template = 'index_terminal'
    end

    respond_to do |format|
      format.html { render template || 'index' }
      format.json { render :json => Lecturer.all.to_json(:only => [:id, :name]) }
    end
  end

  def show
    @terminal = params[:terminal] ? true : false
    @id = params[:id].to_i
    unless @lecturer = Lecturer.find_by_id(@id)
      suffix = @terminal ? '?terminal=true' : ''
      redirect_to :controller => 'timetable/lecturers' + suffix
    else
      teaching_places = @lecturer.teaching_places
      charge_cards = []
      teaching_places.each do |tp|
        charge_cards << tp.charge_cards
      end
      charge_cards = charge_cards.flatten
      
      pairs = Array.new
      charge_cards.each do |card|
        pairs << card.pairs(:include => :subgroups)
      end
      pairs = pairs.flatten
      @days = Timetable.days
      @times = Timetable.times
      @weeks = Timetable.weeks
      @pairs = Array.new(@days.size).map!{Array.new(@times.size).map!{Array.new(@weeks.size + 1).map!{Array.new}}}
      pairs.each do |pair|
        @pairs[pair.day_of_the_week - 1][pair.pair_number - 1][pair.week] << pair
      end
    end
  end
end
