class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :description
      t.belongs_to :event
      t.belongs_to :user
      t.integer :time
      t.boolean :verfied

      t.timestamps null: false
    end
  end
end
