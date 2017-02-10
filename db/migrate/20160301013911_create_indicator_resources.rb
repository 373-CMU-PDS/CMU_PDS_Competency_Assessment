class CreateIndicatorResources < ActiveRecord::Migration
  def change
    create_table :indicator_resources do |t|
      t.integer :indicator_id
      t.integer :resource_id

      t.timestamps
    end
  end
end
