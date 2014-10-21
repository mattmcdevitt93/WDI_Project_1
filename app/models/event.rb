class Event < ActiveRecord::Base
  has_many :jobs
  # scopes
  # counter cache, stores number of jobs on the event.
  # otherwise I have to do SELECT count(*) FROM jobs where event_id = 1 for each event.
  # http://yerb.net/blog/2014/03/13/three-easy-steps-to-using-counter-caches-in-rails/
end
