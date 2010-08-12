class ClassroomsController < ApplicationController
  active_scaffold do |config|
    config.columns = [:building, :department, :name]
    config.columns[:building].form_ui = :select
    config.columns[:department].form_ui = :select
  end

  def conditions_for_collection
    if params[:except]
      except = params[:except].split(',').collect { |e| e.to_i }
      ['classrooms.id NOT IN (?)', except]
    else
      super
    end
  end
end