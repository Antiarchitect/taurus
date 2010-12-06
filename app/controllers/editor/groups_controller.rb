class Editor::GroupsController < Editor::BaseController
  before_filter :find_group, :only => [:create, :destroy]
  def index
    except = params[:except].any? ? params[:except].to_a : 0
    group = params[:group].to_s.gsub('%', '\%').gsub('_', '\_') + '%'
    @groups = Group.all(:conditions => ['id NOT IN (?) AND name LIKE ?', except, group])

    respond_to do |format|
      format.json { render :json => @groups }
    end
  end

  def create
    unless @group
      flash[:error] = "Группа не найдена"
    else
      groups_ids = YAML.load(cookies[:groups])
      groups_ids << @group.id
      cookies[:groups] = YAML.dump(groups_ids)
    end
  end

  def destroy
    unless @group
      flash[:error] = "Группа не найдена"
    else
      groups_ids = YAML.load(cookies[:groups])
      groups_ids.delete(@group.id.to_i)
      cookies[:groups] = YAML.dump(groups_ids)
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def find_group
    @group = Group.find_by_id(params[:id])
  end
end
