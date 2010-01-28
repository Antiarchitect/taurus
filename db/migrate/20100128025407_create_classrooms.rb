class CreateClassrooms < ActiveRecord::Migration
  def self.up
    create_table :classrooms do |t|
      t.integer :building
      t.string :classroom_number

      t.timestamps
    end
  end

  def self.down
    drop_table :classrooms
  end
end
