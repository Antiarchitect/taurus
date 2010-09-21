class DeptHead::ChargeCardsController < DeptHead::BaseController
  active_scaffold do |config|
    config.columns = [:teaching_place, :jets, :discipline, :lesson_type, :hours_quantity, :groups]
    config.create.columns.exclude :groups
    config.update.columns.exclude :groups
    config.list.columns.exclude :jets
    config.show.columns.exclude :jets
    config.columns[:discipline].form_ui = :select
    config.columns[:lesson_type].form_ui = :select
    config.columns[:teaching_place].form_ui = :select
    config.columns[:discipline].clear_link
    config.columns[:groups].clear_link
  end
end
