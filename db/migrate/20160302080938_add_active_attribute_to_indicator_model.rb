class AddActiveAttributeToIndicatorModel < ActiveRecord::Migration

  def change
    add_column :indicators, :active, :boolean
  end

end
