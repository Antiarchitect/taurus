class PairsController < ApplicationController
  layout nil
  layout 'application', :except => :edit
  
  def create
    @pair = Pair.create do |p|
      p.classroom_id = params[:classroom_id]
      p.day_of_the_week = params[:day_of_the_week]
      p.pair_number = params[:pair_number]
      p.week_number = params[:week_number]
    end
    @container = params[:container]

    respond_to do |format|
      format.js
    end
  end

  def edit
    @pair = Pair.find_by_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def update
    if params[:pair]
      Pair.update(params[:id],
        :charge_card_id => params[:pair][:charge_card]
      )
      @pair = Pair.find_by_id(params[:id])
      @container = "container_grid#{@pair.classroom_id}_week#{@pair.week_number}_day#{@pair.day_of_the_week}_time#{@pair.pair_number}"
    else
      if params[:classroom]
        Pair.update(params[:id],
          :classroom_id => params[:classroom]
        )
      end
      @pair = Pair.find_by_id(params[:id])
      @pair.week_number = params[:week_number] if params[:week_number]
      @pair.day_of_the_week = params[:day_of_the_week] if params[:day_of_the_week]
      @pair.pair_number = params[:pair_number] if params[:pair_number]
      @pair.save!
      @container = params[:container]
    end
    respond_to do |format|
      format.js
    end
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