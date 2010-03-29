class SpecialitiesController < ApplicationController
  active_scaffold do |config|
    config.columns = [:code, :name]
    config.nested.add_link('Группы', [:groups])
  end
end
