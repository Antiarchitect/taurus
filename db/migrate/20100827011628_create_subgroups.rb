class CreateSubgroups < ActiveRecord::Migration
  def self.up
    create_table :subgroups do |t|
      t.integer :group_id
      t.integer :pair_id

      t.integer :number # 0 - no subgroups
                        # 1 - first subgroup
                        # 2 - second subgroup
                        # and so on
      t.timestamps
    end
  end

  def self.down
    drop_table :subgroups
  end
end
