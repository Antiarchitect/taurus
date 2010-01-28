class CreateLecturers < ActiveRecord::Migration
  def self.up
    create_table :lecturers do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :lecturers
  end
end
