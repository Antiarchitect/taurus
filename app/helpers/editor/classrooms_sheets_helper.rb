module Editor::ClassroomsSheetsHelper
  def buildings_for_select
    Building.all.map { |d| [d.name, d.id]}
  end
end
