class CreateDeletedAnswers < ActiveRecord::Migration
  def change
    create_table :deleted_answers do |t|
      t.integer :answer_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps null: false
    end
  end
end
