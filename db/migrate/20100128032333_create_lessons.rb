class CreateLessons < ActiveRecord::Migration
  def self.up
    create_table :lessons do |t|
      t.integer :discipline_id
      t.integer :lecturer_id
      t.integer :lesson_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lessons
  end
end
