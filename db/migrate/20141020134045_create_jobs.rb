class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :event
      t.belongs_to :user
      t.boolean :verified

      t.timestamps null: false
    end
  end
end
