class Timetable::GroupsListsController < ApplicationController
  def index
    @groups_lists = GroupsList.with_groups.all
  end

  def new
    @groups_list = GroupsList.new(:name => "название...")
  end

  def create
    @groups_list = GroupsList.new(params[:groups_list])
    @groups_list.save
    flash[:notice] = "Лист #{@groups_list.name} успешно добавлен."

    redirect_to timetable_groups_lists_path
  end
end

