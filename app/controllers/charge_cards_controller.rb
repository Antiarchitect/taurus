class ChargeCardsController < ApplicationController
  active_scaffold do |config|
    config.columns = [:teaching_place, :jets, :discipline, :lesson_type]
    config.list.columns << :groups
    config.list.columns.exclude :jets
    config.columns[:discipline].form_ui = :select
    config.columns[:lesson_type].form_ui = :select
    config.columns[:teaching_place].form_ui = :select
  end

  def list_respond_to_json
    render :json => @records.to_json(:only => [:id], :methods => :name_for_pair_edit)
  end
end