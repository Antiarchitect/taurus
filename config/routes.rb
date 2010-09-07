ActionController::Routing::Routes.draw do |map|
  map.admin_root '/admin/departments', :controller => 'admin/departments'
  map.editor_root '/classrooms_grids', :controller => 'classrooms_grids'
  map.supervisor_root '/supervisor/lecturers', :controller => 'supervisor/lecturers'
  map.dept_head_root '/department/lecturers', :controller => 'department/lecturers'
  
  map.namespace :admin do |a|
    a.resources :departments
    a.resources :editors
    a.resources :supervisors
    a.resources :admins
  end

  map.devise_for :admin, :path_names => { :sign_in => 'login', :sign_out => 'logout'}
  map.new_admin_session '/admin/login', :controller => 'sessions', :action => 'new', :conditions => { :method => :get }
  map.admin_session '/admin/login', :controller => 'sessions', :action => 'create', :conditions => { :method => :post }
  map.destroy_admin_session '/admin/logout', :controller => 'sessions', :action => 'destroy', :conditions => { :method => :get }

  map.devise_for :editor, :path_names => { :sign_in => 'login', :sign_out => 'logout'}
  map.new_editor_session '/editor/login', :controller => 'sessions', :action => 'new', :conditions => { :method => :get }
  map.editor_session '/editor/login', :controller => 'sessions', :action => 'create', :conditions => { :method => :post }
  map.destroy_editor_session '/editor/logout', :controller => 'sessions', :action => 'destroy', :conditions => { :method => :get }

  map.devise_for :supervisor, :path_names => { :sign_in => 'login', :sign_out => 'logout'}
  map.new_supervisor_session '/supervisor/login', :controller => 'sessions', :action => 'new', :conditions => { :method => :get }
  map.supervisor_session '/supervisor/login', :controller => 'sessions', :action => 'create', :conditions => { :method => :post }
  map.destroy_supervisor_session '/supervisor/logout', :controller => 'sessions', :action => 'destroy', :conditions => { :method => :get }

  map.devise_for :dept_head, :path_names => { :sign_in => 'login', :sign_out => 'logout'}
  map.new_dept_head_session '/department/login', :controller => 'sessions', :action => 'new', :conditions => { :method => :get }
  map.dept_head_session '/department/login', :controller => 'sessions', :action => 'create', :conditions => { :method => :post }
  map.destroy_dept_head_session '/department/logout', :controller => 'sessions', :action => 'destroy', :conditions => { :method => :get }

  map.resources :subgroups

  map.namespace :timetable do |t|
    t.resources :groups
  end

  map.resources :specialities

  map.resources :teaching_places

  map.resources :faculties, :active_scaffold => :true

  map.resources :departments, :active_scaffold => :true

  map.resources :charge_cards, :active_scaffold => :true

  map.resources :jets, :active_scaffold => :true

  map.resources :classrooms_grids

  map.resources :grids, :active_scaffold => :true

  map.resources :buildings, :active_scaffold => :true

  map.resources :groups, :active_scaffold => :true

  map.resources :lecturers, :active_scaffold => :true

  map.resources :disciplines, :active_scaffold => :true

  map.resources :lesson_types, :active_scaffold => :true

  map.resources :lessons, :active_scaffold => :true

  map.resources :classrooms, :active_scaffold => :true

  map.resources :pairs, :active_scaffold => :true, :member => {
    :edit_from_classrooms => :get,
    :update_on_drop => :put
  }
  
  map.root :controller => "timetable/groups"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
