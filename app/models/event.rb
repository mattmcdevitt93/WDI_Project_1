class Event < ActiveRecord::Base
  has_many :jobs

  # You can chain these
  # lookup scopes here: http://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html
  scope :not_expired, -> { where('event_time_start > ?', Time.now)}
  scope :overbooked, -> { where('slots < jobs_count') }
  scope :full, -> { where('slots = jobs_count') }
  scope :this_month, -> { where("DATE_PART('month', event_time_start) = ?", Time.now.month)}

  # Event.already_applied(User.first)
  scope :already_applied, -> (user) { joins(:jobs).where('user_id = ?', user.id) }


  # Methods for individual events
  def expired?
    event_time_start > Time.now
  end

  def overbooked?
    slots < jobs_count
  end

  def full?
    slots == jobs_count
  end

  def already_applied?(user)
    jobs.pluck(:user_id).include? user.id
  end

end
