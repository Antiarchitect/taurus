ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |a|
    a.devise_for :users
    a.resources :departments
    a.resources :editors
    a.resources :supervisors
    a.resources :admins
  end

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

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "admin/departments"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
