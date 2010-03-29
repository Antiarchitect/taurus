class CreateDisciplines < ActiveRecord::Migration
  def self.up
    create_table :disciplines do |t|
      t.integer :department_id
      t.string :name
      t.string :full_name

      t.timestamps
    end
  end

  def self.down
    drop_table :disciplines
  end
end
