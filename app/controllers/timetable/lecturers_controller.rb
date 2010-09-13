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
    if params[:terminal]
      @terminal = true
    end
    @id = params[:id]
    @lecturer = Lecturer.find_by_id(params[:id])
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
    @pairs = Array.new(@days.size).map!{Array.new(@times.size).map!{Array.new(@weeks.size).map!{Array.new}}}
    pairs.each do |pair|
      @pairs[pair.day_of_the_week - 1][pair.pair_number - 1][pair.week_number - 1] << pair
    end
  end
end
