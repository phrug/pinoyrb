Pinoyrb::Application.routes.draw do
  resources :events, :only => [:index, :show]

  devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root :to => "pages#index"
  get "/learn", :to => "pages#learn", :as => 'learn'

end
