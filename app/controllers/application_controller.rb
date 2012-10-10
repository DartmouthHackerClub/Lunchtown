class ApplicationController < ActionController::Base
  before_filter :authenticate_person!
  protect_from_forgery
end
