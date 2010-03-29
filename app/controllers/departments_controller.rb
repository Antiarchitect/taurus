class DepartmentsController < ApplicationController
  active_scaffold do |config|
    config.columns = [:faculty, :name, :full_name]
    config.columns[:faculty].form_ui = :select
    config.nested.add_link('Аудитории', [:classrooms])
    config.nested.add_link('Дисциплины', [:disciplines])
    config.nested.add_link('Преподаватели', [:teaching_places])
    config.nested.add_link('Специальности', [:specialities])
  end
end
