class LessonTypesController < ApplicationController
  active_scaffold do |config|
    config.columns = [:name]
  end
end
