Pinoyrb::Application.routes.draw do

  resource :search, :only => [:show]
  resources :events, :only => [:index, :show]
  resources :tags, :only => [:index, :show]

  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users
  resources :users, :only => [:index, :show]

  root :to => "pages#index"
  get "/learn", :to => "pages#learn", :as => 'learn'

end
