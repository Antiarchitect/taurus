class CreateJets < ActiveRecord::Migration
  def self.up
    create_table :jets do |t|
      t.integer :charge_card_id
      t.integer :group_id

      t.timestamps
    end
  end

  def self.down
    drop_table :jets
  end
end
