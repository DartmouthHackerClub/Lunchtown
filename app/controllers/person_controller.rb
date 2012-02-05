class PersonController < ApplicationController
  before_filter :setup_person
  def index
  end
  def show
    redirect_to '/'
  end

  def update
    if(current_person.update_attributes(params[:person]))
      flash[:notice] = t('person.update.flash')
      redirect_to '/'
    else
      render  :controller=>:person,:action=>:index
    end
  end
private
  def setup_person
    @person = current_person
    @person.freetimes.build(:date => Date.today) if @person.freetimes.count <1
  end
end