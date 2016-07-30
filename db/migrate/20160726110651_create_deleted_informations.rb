class CreateDeletedInformations < ActiveRecord::Migration
  def change
    create_table :deleted_informations do |t|
      t.integer :information_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps null: false
    end
  end
end
