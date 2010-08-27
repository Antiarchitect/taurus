class GroupsController < ApplicationController
  active_scaffold do |config|
    config.columns = [:name, :forming_year, :course]
    config.create.columns.exclude :course
    config.update.columns.exclude :course
  end

  def list_respond_to_json
    render :json => @records.to_json(:only => [:id, :name])
  end
end