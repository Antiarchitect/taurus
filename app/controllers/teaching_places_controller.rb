class TeachingPlacesController < ApplicationController
  active_scaffold do |config|
    config.columns = [:department, :lecturer]
    config.columns[:lecturer].form_ui = :select
    config.nested.add_link('Карта распределения нагрузки', [:charge_cards])
  end

  def list_respond_to_json
    render :json => @records.to_json(:only => [:id], :methods => :name)
  end
end
