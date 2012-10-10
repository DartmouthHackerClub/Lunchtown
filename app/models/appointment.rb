class Appointment < ActiveRecord::Base
  belongs_to :location
  belongs_to :person1, :class_name => 'Person', :foreign_key => 'person1_id'
  belongs_to :person2, :class_name => 'Person', :foreign_key => 'person2_id'
  belongs_to :freetime
  accepts_nested_attributes_for :freetime, :allow_destroy => true
  validate :person_id_less_than
  def person_id_less_than
    errors.add(:person1,"person1 needs to have a lower id than person2") unless person1_id < person2_id
  end
end
