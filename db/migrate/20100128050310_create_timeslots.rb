class CreateTimeslots < ActiveRecord::Migration
  def self.up
    create_table :timeslots do |t|
      t.integer :week_number
      t.integer :week_day
      t.integer :pair_number

      t.timestamps
    end
  end

  def self.down
    drop_table :timeslots
  end
end
