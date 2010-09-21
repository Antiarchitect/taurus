class RenameInDisciplines < ActiveRecord::Migration
  def self.up
    rename_column :disciplines, :name, :short_name
    rename_column :disciplines, :full_name, :name
  end

  def self.down
    rename_column :disciplines, :name, :full_name
    rename_column :disciplines, :short_name, :name
  end
end
