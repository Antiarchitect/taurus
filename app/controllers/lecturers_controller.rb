class LecturersController < ApplicationController
  active_scaffold do |config|
    config.columns = [:name, :teaching_places]
  end
end
