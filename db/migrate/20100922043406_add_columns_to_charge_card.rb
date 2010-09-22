class AddColumnsToChargeCard < ActiveRecord::Migration
  def self.up
    add_column :charge_cards, :hours_per_week, :integer
    add_column :charge_cards, :weeks_quantity, :integer
  end

  def self.down
    remove_column :charge_cards, :hours_per_week, :integer
    remove_column :charge_cards, :weeks_quantity, :integer
  end
end
