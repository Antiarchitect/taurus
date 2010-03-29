class CreateFaculties < ActiveRecord::Migration
  def self.up
    create_table :faculties do |t|
      t.string :full_name
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :faculties
  end
end
