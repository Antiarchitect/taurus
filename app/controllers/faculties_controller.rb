class FacultiesController < ApplicationController
  active_scaffold do |config|
    config.columns = [:name]
    config.nested.add_link('Кафедры', [:departments])
  end
end
