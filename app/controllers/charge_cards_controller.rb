class ChargeCardsController < ApplicationController
  active_scaffold do |config|
    config.columns = [:lecturer, :jets, :discipline, :lesson_type]
    config.columns[:lesson_type].form_ui = :select
    config.columns[:lecturer].form_ui = :select
  end
end