class ClassroomsController < ApplicationController
  active_scaffold do |config|
    config.columns = [:building, :department, :name]
    config.columns[:building].form_ui = :select
    config.columns[:department].form_ui = :select
  end

  def index
    except = params[:except].split(',').collect { |e| e.to_i } if params[:except]
    @classrooms = Classroom.all(:conditions => [ 'id NOT IN (?)', except || 0 ])

    respond_to do |format|
      format.html
      format.json {render :json => @classrooms.to_json}
    end
  end
end