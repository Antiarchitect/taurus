class CreateChargeCards < ActiveRecord::Migration
  def self.up
    create_table :charge_cards do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :charge_cards
  end
end
