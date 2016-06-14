class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.integer :place_id
      t.text :name
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps null: false
    end
  end
end
