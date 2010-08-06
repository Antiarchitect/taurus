include ChainSelectsHelper

class PairsController < ApplicationController
  layout nil
  layout 'application', :except => :edit
  
  def create
    @pair = Pair.create do |p|
      p.classroom_id = params[:classroom]
      p.day_of_the_week = params[:day]
      p.pair_number = params[:time]
      p.week_number = params[:week]
    end
    @container = params[:container]
  end

  def edit
    @pair = Pair.find_by_id(params[:id])
  end

  def update
    if params[:pair][:charge_card]
      Pair.update(params[:id],
        :charge_card_id => params[:pair][:charge_card]
      )
    end
    @pair = Pair.find(params[:id])
    @container = "container_grid#{@pair.classroom_id}_week#{@pair.week_number}_day#{@pair.day_of_the_week}_time#{@pair.pair_number}"
  end

  def update_on_drop
    if params[:classroom]
      Pair.update(params[:id],
        :classroom_id => params[:classroom]
      )
      @assoc = Classroom.find_by_id(params[:classroom])
    end
    pair = Pair.find_by_id(params[:id])
    pair.week_number = params[:week] if params[:week]
    pair.day_of_the_week = params[:day] if params[:day]
    pair.pair_number = params[:time] if params[:time]
    pair.save!
    @pairs = @assoc.pairs
    @pair = Pair.find(params[:id])
    @container = params[:container]
  end

  def destroy
    @id = params[:id]
    pair = Pair.find_by_id(@id)
    pair.destroy

    respond_to do |format|
      format.js
    end
  end
end