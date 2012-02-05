class Appointment < ActiveRecord::Base
  belongs_to :location
  belongs_to :person
  belongs_to :freetime
  accepts_nested_attributes_for :freetime, :allow_destroy => true
end
