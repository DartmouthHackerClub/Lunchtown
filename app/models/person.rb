class Person < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :appointments
  has_many :freetimes
  devise :cas_authenticatable
  accepts_nested_attributes_for :freetimes, :allow_destroy => true
end
