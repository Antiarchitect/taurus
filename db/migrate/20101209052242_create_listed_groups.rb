class CreateListedGroups < ActiveRecord::Migration
  def self.up
    create_table :listed_groups do |t|
      t.integer :group_id
      t.integer :groups_list_id

      t.timestamps
    end
  end

  def self.down
    drop_table :listed_groups
  end
end

