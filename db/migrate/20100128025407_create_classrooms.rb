class CreateClassrooms < ActiveRecord::Migration
  def self.up
    create_table :classrooms do |t|
      t.integer :building_id
      t.integer :department_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :classrooms
  end
end
