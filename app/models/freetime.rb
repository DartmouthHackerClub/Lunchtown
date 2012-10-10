class Freetime < ActiveRecord::Base
  def self.timeslots
    [10.hours, 11.hours + 15.minutes, 12.hours + 30.minutes,
     13.hours + 45.minutes, 14.hours + 50.minutes, 15.hours + 30.minutes]
  end
  belongs_to :person
  belongs_to :timeslot
 # validates_uniqueness_of :from, :scope => [:person_id, :date]
 # validates_uniqueness_of :to, :scope => [:person_id, :date]
  default_value_for :from, Freetime.timeslots[0].to_i
  default_value_for :to, Freetime.timeslots[1].to_i
  def to_after_from
    errors.add(:to,"Your time slot needs to be longer than 30 minutes") unless  to - from > 30.minutes.to_i
  end
  validate :to_after_from
  def intersects?(other)
    ( from <= other.to) and (other.from <= to)
  end
end
