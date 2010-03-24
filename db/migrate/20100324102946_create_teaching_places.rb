class CreateTeachingPlaces < ActiveRecord::Migration
  def self.up
    create_table :teaching_places do |t|
      t.integer :department_id
      t.integer :lecturer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :teaching_places
  end
end
