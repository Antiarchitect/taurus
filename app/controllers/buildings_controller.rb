class BuildingsController < ApplicationController
  active_scaffold do |config|
    config.columns = [:name]
  end
end
