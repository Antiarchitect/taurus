class PairsController < ApplicationController  
  def create
    @pair = Pair.new do |p|
      p.classroom_id = params[:classroom]
      timeslot = Timeslot.first(:conditions => {:week_number => params[:week],
        :week_day => params[:day], :pair_number => params[:time]})
      p.timeslot = timeslot
    end
    @pair.save!
    @container = params[:container]
  end

  def edit
    @faculties = Faculty.all
    unless params[:faculty].nil?
      @departments = Faculty.find_by_id(params[:faculty]).departments
    else
      @departments = Department.all
    end
    unless params[:department].nil?
      @lecturers = Department.find_by_id(params[:department]).lecturers
    else
      @lecturers = Lecturer.all
    end
    unless params[:lecturer].nil?
      @charge_cards = Lecturer.find_by_id(params[:lecturer]).charge_cards
    else
      @charge_cards = Lecturer.all
    end
  end

  def update_on_drop
    if params[:classroom]
      Pair.update(params[:id],
        :classroom_id => params[:classroom]
      )
      @assoc = Classroom.find_by_id(params[:classroom])
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