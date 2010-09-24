class DeptHead::ChargeCardsController < DeptHead::BaseController
  active_scaffold do |config|
    config.columns = [:jets, :discipline, :lesson_type, :hours_quantity, :hours_per_week, :weeks_quantity, :groups, :teaching_place]
    config.create.columns.exclude :groups, :hours_quantity, :teaching_place
    config.update.columns.exclude :groups, :hours_quantity
    config.list.columns.exclude :jets, :teaching_place
    config.columns[:discipline].form_ui = :record_select
    config.columns[:lesson_type].form_ui = :select
    config.columns[:teaching_place].form_ui = :record_select
    config.columns[:discipline].clear_link
    config.columns[:groups].clear_link
  end
end
