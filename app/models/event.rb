class Event < ActiveRecord::Base
  has_many :jobs, :dependent => :destroy

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

  def length_in_hours
    ((event_time_finish - event_time_start) / 3600).round
  end

  def self.hours_this_month
    this_month.to_a.sum(&:length_in_hours)
  end

  def self.hours_this_month_for_user(user, event_type)
    joins(:jobs).where('events.event_type = ?', event_type).where('jobs.user_id = ?', user.id).to_a.sum(&:length_in_hours)
  end

end
