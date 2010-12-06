class Editor::GroupsListsController < Editor::BaseController
  before_filter :get_groups_list, :only => [:show, :create]

  def show
    respond_to do |format|
      format.html
      format.json { render :json => @groups_list.groups }
    end
  end

  def create

  end

  private

  def get_groups_list
    cookies[:groups] ||= YAML.dump([0])
    groups_ids = YAML.load(cookies[:groups])
    groups = Group.all(:conditions => { :id => groups_ids })
    @groups_list = Lists::GroupsList.new(groups)
  end
end
