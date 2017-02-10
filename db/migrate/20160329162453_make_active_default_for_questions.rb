class MakeActiveDefaultForQuestions < ActiveRecord::Migration
  def change
    change_column :questions, :active, :boolean, :default => true
    change_column :indicator_questions, :active, :boolean, :default => true
  end
end
