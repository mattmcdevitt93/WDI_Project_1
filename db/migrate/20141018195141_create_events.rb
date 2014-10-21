class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :event, null: false
      t.date :event_time, null: false
      t.text :location, null: false
      t.string :event_type, null: false
      t.timestamps :created_at
      t.timestamps :updated_at
      t.integer :slots, null: false

      t.timestamps null: false
    end
  end
end
