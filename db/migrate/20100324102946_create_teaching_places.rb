class CreateTeachingPlaces < ActiveRecord::Migration
  def self.up
    create_table :teaching_places do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :teaching_places
  end
end
