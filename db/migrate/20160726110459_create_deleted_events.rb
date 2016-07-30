class CreateDeletedEvents < ActiveRecord::Migration
  def change
    create_table :deleted_events do |t|
      t.integer :event_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps null: false
    end
  end
end
