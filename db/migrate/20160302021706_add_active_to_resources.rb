class AddActiveToResources < ActiveRecord::Migration
  def change
    add_column :resources, :active, :boolean
  end
end
