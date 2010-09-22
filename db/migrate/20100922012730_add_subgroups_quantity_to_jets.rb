class AddSubgroupsQuantityToJets < ActiveRecord::Migration
  def self.up
    add_column :jets, :subgroups_quantity, :integer, :default => 0
  end

  def self.down
    remove_column :jets, :subgroups_quantity
  end
end
