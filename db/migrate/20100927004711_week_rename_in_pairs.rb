class WeekRenameInPairs < ActiveRecord::Migration
  def self.up
    rename_column :pairs, :week_number, :week
  end

  def self.down
    rename_column :pairs, :week, :week_number
  end
end
