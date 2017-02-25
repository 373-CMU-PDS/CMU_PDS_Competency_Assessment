class AddActiveColumnToCompetency < ActiveRecord::Migration
  def change
    add_column :competencies, :active, :boolean
  end
end
