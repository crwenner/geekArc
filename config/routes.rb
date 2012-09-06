GeekArc::Application.routes.draw do
  root :to => 'welcome#index'
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  resources :sessions

  resources :blog, :controller => "posts"
end
