class PairsController < ApplicationController
  layout nil
  layout 'application', :except => :edit
  
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
    @pair = Pair.find_by_id(params[:id])
    @faculties = Faculty.all
    if params[:faculty]
      @departments = Faculty.find_by_id(params[:faculty]).lecturers
    else
      @departments = Department.all
    end
    @lecturers = Lecturer.all
    @charge_cards = Lecturer.all

    respond_to do |format|
      format.js {
        
      }
    end
  end

  def update
    
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