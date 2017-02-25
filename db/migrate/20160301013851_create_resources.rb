class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :type
      t.string :description
      t.string :link

      t.timestamps
    end
  end
end
