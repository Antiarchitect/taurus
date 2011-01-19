class DeptHead::ChargeCardsController < DeptHead::BaseController
  active_scaffold do |config|
    config.actions << :delete
    config.columns = [:teaching_place, :lesson_type, :jets, :discipline, :hours_quantity, :hours_per_week, :weeks_quantity, :groups]
    config.create.columns.exclude :groups, :hours_quantity
    config.update.columns.exclude :groups, :hours_quantity
    config.list.columns.exclude :jets
    config.columns[:discipline].form_ui = :record_select
    config.columns[:lesson_type].form_ui = :select
    config.columns[:teaching_place].form_ui = :select
    config.columns[:teaching_place].clear_link
    config.columns[:discipline].clear_link
    config.columns[:groups].clear_link
  end
end
