class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :event, counter_cache: true # For event counter cache of jobs_count
end
