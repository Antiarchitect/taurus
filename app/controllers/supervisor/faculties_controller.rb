class Supervisor::FacultiesController < Supervisor::BaseController
   active_scaffold do |config|
    config.columns = [:full_name, :name]
    config.nested.add_link('Кафедры', [:departments])
  end
end
