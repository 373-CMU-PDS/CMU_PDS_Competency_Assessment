class RenameResouceTypeColumn2 < ActiveRecord::Migration
  def change
    rename_column :resources, :resource_type, :resource_category
  end
end
