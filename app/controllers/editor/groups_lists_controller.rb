class Editor::GroupsListsController < Editor::BaseController
  def show
    cookies[:groups] ||= YAML.dump([0])
    groups_ids = YAML.load(cookies[:groups])
    groups = Group.all(:conditions => { :id => groups_ids })
    @groups_list = Lists::GroupsList.new(groups)

    respond_to do |format|
      format.html
      format.json { render :json => @groups_list.groups }
    end
  end
end
