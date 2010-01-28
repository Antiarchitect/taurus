class CreatePairs < ActiveRecord::Migration
  def self.up
    create_table :pairs do |t|
      t.integer :classroom_id
      t.integer :group_id
      t.integer :lecturer_id
      t.integer :lesson_id
      t.integer :timeslot_id
      t.boolean :subgroup

      t.timestamps
    end
  end

  def self.down
    drop_table :pairs
  end
end
