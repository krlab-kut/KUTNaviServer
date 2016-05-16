class CreateNarukos < ActiveRecord::Migration
  def change
    create_table :narukos do |t|
      t.integer :place_id
      t.timestamp :created_at
      t.timestamp :updarted_at

      t.timestamps null: false
    end
  end
end
