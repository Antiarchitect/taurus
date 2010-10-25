class AddWhishesToLecturers < ActiveRecord::Migration
  def self.up
    add_column :lecturers, :whish, :text
  end

  def self.down
    remove_column :lecturers, :whish
  end
end
