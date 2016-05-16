class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :id
      t.text :name
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps null: false
    end
  end
end
