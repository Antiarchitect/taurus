class ChargeCardsController < ApplicationController
  active_scaffold do |config|
    config.columns = [:teaching_place, :jets, :discipline, :lesson_type]
    config.columns[:discipline].form_ui = :select
    config.columns[:lesson_type].form_ui = :select
    config.columns[:teaching_place].form_ui = :select
  end
end