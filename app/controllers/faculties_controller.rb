class FacultiesController < ApplicationController
  active_scaffold do |config|
    config.columns = [:name, :full_name]
    config.nested.add_link('Кафедры', [:departments])
  end
end
