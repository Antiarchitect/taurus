class CreateSpecialities < ActiveRecord::Migration
  def self.up
    create_table :specialities do |t|
      t.integer :department_id

      t.string :code
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :specialities
  end
end
