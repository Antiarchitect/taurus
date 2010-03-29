class CreateChargeCards < ActiveRecord::Migration
  def self.up
    create_table :charge_cards do |t|
      t.integer :discipline_id
      t.integer :teaching_place_id
      t.integer :lesson_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :charge_cards
  end
end
