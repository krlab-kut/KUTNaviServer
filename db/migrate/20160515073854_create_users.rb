class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.text :uuid
      t.int :place_id
      t.timestamp :created_at
      t.timsestamp :updated_at

      t.timestamps null: false
    end
  end
end
