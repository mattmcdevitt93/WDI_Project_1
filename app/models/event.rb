class Event < ActiveRecord::Base
  has_many :jobs

  # You can chain these
  # lookup scopes here: http://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html
  scope :not_expired, -> { where('event_time_start > ?', Time.now)}
  scope :overbooked, -> { where('slots < jobs_count') }
  scope :full, -> { where('slots = jobs_count') }

  # Event.already_applied(User.first)
  scope :already_applied, -> (user) { joins(:jobs).where('user_id = ?', user.id) }

end
