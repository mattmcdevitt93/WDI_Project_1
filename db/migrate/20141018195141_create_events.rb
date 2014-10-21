class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :event, null: false
      t.time :event_time_start, null: false
      t.time :event_time_finish, null: false
      t.text :location, null: false
      t.string :event_type, null: false
      t.timestamps :created_at
      t.timestamps :updated_at
      t.integer :slots, null: false
      t.text :created_by, null: false

      t.timestamps null: false
    end
  end
end
