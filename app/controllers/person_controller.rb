class PersonController < ApplicationController
  before_filter :setup_person
  def index
  end
  def show
    redirect_to '/'
  end

  def update
    #UUGLY UGGLY UGGLLLYYYYY
    if params[:person][:gender] == "mf"
      params[:person][:looking_for] = "fm"
    elsif params[:person][:gender] == "fm"
      params[:person][:looking_for] = "mf"
    else
      params[:person][:looking_for] =   params[:person][:gender]
    end
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