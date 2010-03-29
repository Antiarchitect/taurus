class TeachingPlacesController < ApplicationController
  active_scaffold do |config|
    config.columns[:lecturer].form_ui = :select
  end
end
