namespace :jobs do
  desc "Resets the jobs_count on events"
  task reset_counter: :environment do
    Event.all.each { |event| Event.reset_counters(event.id, :jobs) }
  end

end
