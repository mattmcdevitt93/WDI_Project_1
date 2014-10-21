class AddJobsCountToEvents < ActiveRecord::Migration
  def change
    add_column :events, :jobs_count, :integer, index: true, default: 0
  end
end
