class RenameColumnsInDepartments < ActiveRecord::Migration
  def self.up
    rename_column :departments, :name, :short_name
    rename_column :departments, :full_name, :name
  end

  def self.down
    rename_column :departments, :name, :full_name
    rename_column :departments, :short_name, :name
  end
end
