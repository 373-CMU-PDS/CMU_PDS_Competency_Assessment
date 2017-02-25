class MakeActivesDefaultToTrue < ActiveRecord::Migration
  def change
    change_column :resources, :active, :boolean, :default => true
    change_column :competencies, :active, :boolean, :default => true
    change_column :indicators, :active, :boolean, :default => true
  end
end
