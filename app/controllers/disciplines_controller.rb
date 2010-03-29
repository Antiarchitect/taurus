class DisciplinesController < ApplicationController
  active_scaffold do |config|
    config.columns = [:name, :full_name]
  end
end
