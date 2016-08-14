class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :place_id
      t.string :registration_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps null: false
    end
  end
end
