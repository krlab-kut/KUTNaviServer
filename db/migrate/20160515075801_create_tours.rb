class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.integer :id
      t.text :title
      t.text :timetable
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps null: false
    end
  end
end
