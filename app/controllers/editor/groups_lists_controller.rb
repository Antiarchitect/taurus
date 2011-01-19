class Editor::GroupsListsController < Editor::BaseController
  before_filter :get_groups_list, :only => [:new, :show]

  def new
    groups = Group.all(:conditions => { :id => @groups_ids })
    @groups_list = Lists::GroupsList.new(groups)
  end

  def show
    @days = Timetable.days
    @times = Timetable.times
    @weeks = Timetable.weeks
    groups = Group.for_timetable.all(:conditions => { :id => @groups_ids })
    @groups_list = Lists::GroupsList.new(groups)
    @pairs = []
    @groups_list.groups.each do |group|
      @pairs << group.get_pairs
    end

    respond_to do |format|
      format.html
      format.json { render :json => @groups_list.groups }
    end
  end

  private

  def get_groups_list
    cookies[:groups] ||= YAML.dump([0])
    @groups_ids = YAML.load(cookies[:groups])
  end
end

