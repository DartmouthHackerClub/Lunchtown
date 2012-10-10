Lunchtown::Application.routes.draw do
  devise_for :persons
  resources :person
  root :to => "person#index"
  #get "/", :controller => :person , :action=> :index
  #post "/", :controller =>  :person, :action => :update
end
