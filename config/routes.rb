ActionController::Routing::Routes.draw do |map|
  map.admin_root '/admin/departments', :controller => 'admin/departments'
  map.editor_root '/editor/classrooms', :controller => 'editor/classrooms'
  map.supervisor_root '/supervisor/lecturers', :controller => 'supervisor/lecturers'
  map.dept_head_root '/dept_head/lecturers', :controller => 'dept_head/lecturers'
  
  map.namespace :admin do |a|
    a.resources :dept_heads
    a.resources :editors
    a.resources :supervisors
    a.resources :admins
  end

  map.namespace :editor do |e|
    e.resources :classrooms
    e.resources :pairs
  end

  map.namespace :dept_head do |d|
    d.resources :teaching_places
    d.resources :disciplines
  end

  map.namespace :supervisor do |s|
    s.resources :lecturers
    s.resources :faculties
    s.resources :departments
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
  map.new_dept_head_session '/dept_head/login', :controller => 'sessions', :action => 'new', :conditions => { :method => :get }
  map.dept_head_session '/dept_head/login', :controller => 'sessions', :action => 'create', :conditions => { :method => :post }
  map.destroy_dept_head_session '/dept_head/logout', :controller => 'sessions', :action => 'destroy', :conditions => { :method => :get }

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
