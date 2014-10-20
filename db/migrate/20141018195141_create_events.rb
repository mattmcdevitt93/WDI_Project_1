class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :event
      t.date :event_time
      t.text :location
      t.string :event_type
      t.timestamps :created_at
      t.timestamps :updated_at
      t.integer :volunteer

      t.timestamps null: false
    end
  end
end
