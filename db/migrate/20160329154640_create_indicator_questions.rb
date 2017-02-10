class CreateIndicatorQuestions < ActiveRecord::Migration
  def change
    create_table :indicator_questions do |t|
      t.integer :indicator_id
      t.integer :question_id
      t.boolean :active

      t.timestamps
    end
  end
end
