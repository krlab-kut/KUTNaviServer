class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.text :content
      t.timestamp :created_at
      t.string :updated_at

      t.timestamps null: false
    end
  end
end
