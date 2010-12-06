class Editor::GroupsController < Editor::BaseController
  def index
    except = params[:except].any? ? params[:except].to_a : 0
    @groups = Group.all(:conditions => ['id NOT IN (?)', except])

    respond_to do |format|
      format.json { render :json => @groups }
    end
  end

  def create
    @group = Group.find_by_id(params[:id])
    unless @group
      flash[:error] = "Группа не найдена"
    else
      groups_ids = YAML.load(cookies[:groups])
      groups_ids << @group.id
      cookies[:groups] = YAML.dump(groups_ids)
    end
  end
end
