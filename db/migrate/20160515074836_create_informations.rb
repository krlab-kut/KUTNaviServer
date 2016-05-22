class CreateInformations < ActiveRecord::Migration
  def change
    create_table :informations do |t|
      t.text :title
      t.text :content
      t.text :place
      t.text :start_at
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps null: false
    end
  end
end
