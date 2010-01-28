class CreateClassrooms < ActiveRecord::Migration
  def self.up
    create_table :classrooms do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :classrooms
  end
end
