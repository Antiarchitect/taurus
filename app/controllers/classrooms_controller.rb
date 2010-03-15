class ClassroomsController < ApplicationController
  active_scaffold do |config|
    config.columns[:building].form_ui = :select
  end
end