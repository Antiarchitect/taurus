class Supervisor::FacultiesController < Supervisor::BaseController
   active_scaffold do |config|
    config.columns = [:name, :full_name]
    config.nested.add_link('Кафедры', [:departments])
  end
end
