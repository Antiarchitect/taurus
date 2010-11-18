class ClassroomsSheet < ActiveRecord::Base
  serialize :classrooms
  def self.columns() @columns ||= []; end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end
  
  column :classrooms, :text
  
  def building
    @building
  end
  
  def building=(value)
    @building = Building.find_by_id(value)
  end
end
