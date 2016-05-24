class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :parent_id
      t.text :content
      t.boolean :deleted
      t.timestamp :created_at
      t.string :updated_at

      t.timestamps null: false
    end
  end
end
