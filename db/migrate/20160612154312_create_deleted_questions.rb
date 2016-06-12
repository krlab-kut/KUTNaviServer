class CreateDeletedQuestions < ActiveRecord::Migration
  def change
    create_table :deleted_questions do |t|
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
