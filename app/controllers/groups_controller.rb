class GroupsController < ApplicationController
  def list_respond_to_json
    render :json => @records.to_json(:only => [:id, :name])
  end
end