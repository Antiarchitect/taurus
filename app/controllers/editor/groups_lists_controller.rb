class Editor::GroupsListsController < Editor::BaseController
  before_filter :get_groups_list, :only => [:show, :create]

  def show
    groups = Group.all(:conditions => { :id => @groups_ids })
    @groups_list = Lists::GroupsList.new(groups)

    respond_to do |format|
      format.html
      format.json { render :json => @groups_list.groups }
    end
  end

  def create
    @days = Timetable.days
    @times = Timetable.times
    @weeks = Timetable.weeks
    groups = Group.for_timetable.all(:conditions => { :id => @groups_ids })
    @groups_list = Lists::GroupsList.new(groups)
  end

  private

  def get_groups_list
    cookies[:groups] ||= YAML.dump([0])
    @groups_ids = YAML.load(cookies[:groups])
  end
end
