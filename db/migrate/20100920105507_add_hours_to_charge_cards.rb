class AddHoursToChargeCards < ActiveRecord::Migration
  def self.up
    add_column :charge_cards, :hours_quantity, :integer
  end

  def self.down
    remove_column :charge_cards, :hours_quantity
  end
end
