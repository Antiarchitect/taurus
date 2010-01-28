class CreatePairs < ActiveRecord::Migration
  def self.up
    create_table :pairs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :pairs
  end
end
