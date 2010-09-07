class ChargeCardsController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => @records.to_json(:only => [:id], :methods => :name_for_pair_edit) }
    end
  end
end