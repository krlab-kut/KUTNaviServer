class CreateInformations < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.text :title
      t.text :content
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps null: false
    end
  end
end
