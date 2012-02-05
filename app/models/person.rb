require 'set'
class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :appointments
  has_many :freetimes
  devise :cas_authenticatable
  accepts_nested_attributes_for :freetimes, :allow_destroy => true
  def cas_extra_attributes=(extra_attributes)
    print(extra_attributes.to_s)
  end
  def email
    username.gsub(' ','') # Seems to work fine so far, monitor for failing emails
  end

  def self.make_matches(day)
    matched = Set.new
    notmatched = []
    matches = []
    Person.transaction do
      partners = Freetime.where(:date=>day).includes(:persons).order(:from)
      begin
        me = partners.shift
        next if matched.include?(me.person_id)
        i = 0
        mini = -1 # Minimum number of lunches
        minlunchcount = 1.0/0
        while (partners[i].from< me.to) # They could still intersect
          if partners[i].to > me.from
            if(partners[i].person_id < me.person_id)
              lunchcount = Appointment.where(:person1_id => partners[i].person_id, :person2_id=>me.person_id).count
            else
              lunchcount = Appointment.where(:person1_id =>me.person_id, :person2_id=>partners[i].person_id).count
            end
          end
          if(lunchcount < minlunchcount)
            minlunchcount = lunchcount
            mini = i
          end
          i += 1
        end
        if(mini < 0)
          notmatched.push(me.person)
        else
          matched.push(me.person_id)
          matched.push(partners[mini].person_id)
          matches.push([me.person,partners[mini].person])
        end
      end while not partners.empty?
    end
  end
end
