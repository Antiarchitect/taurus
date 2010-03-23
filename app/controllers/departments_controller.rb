class DepartmentsController < ApplicationController
  active_scaffold do |config|
    config.columns = [:name, :faculty]
    config.columns[:faculty].form_ui = :select
  end
end
