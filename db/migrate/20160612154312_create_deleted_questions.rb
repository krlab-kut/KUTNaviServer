class CreateDeletedQuestions < ActiveRecord::Migration
  def change
    create_table :deleted_questions do |t|
      t.integer :question_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps null: false
    end
  end
end
