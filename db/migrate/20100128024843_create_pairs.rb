class CreatePairs < ActiveRecord::Migration
  def self.up
    create_table :pairs do |t|
      t.integer :charge_card_id
      t.integer :classroom_id
      t.integer :timeslot_id
      t.integer :day_of_the_week
      t.integer :pair_number # pair number in day, for example:
                             # first - 8:15 - 9:45, second - 9:55 - 11:25
      t.integer :week_number # week number in terms of study shedule
                             # 0 - both weeks
                             # 1 - first week
                             # 2 - second week

      t.timestamps
    end
  end

  def self.down
    drop_table :pairs
  end
end
