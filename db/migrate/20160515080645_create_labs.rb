class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.integer :id
      t.text :name
      t.text :nickname
      t.integer :place_id
      t.integer :teacher_id
      t.integer :floor
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps null: false
    end
  end
end
