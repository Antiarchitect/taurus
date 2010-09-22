class DeleteHoursQuantityFromChargeCard < ActiveRecord::Migration
  def self.up
    remove_column :charge_cards, :hours_quantity
  end

  def self.down
    add_column :charge_cards, :hours_quantity, :integer
  end
end
