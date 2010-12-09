class CreateGroupsLists < ActiveRecord::Migration
  def self.up
    create_table :groups_lists do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :groups_lists
  end
end
