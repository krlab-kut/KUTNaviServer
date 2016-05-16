class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.text :name
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps null: false
    end
  end
end
