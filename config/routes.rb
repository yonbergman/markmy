Markmy::Application.routes.draw do
  devise_for :users, :controllers => { registrations: :registrations, sessions: :sessions }

  namespace :admin do
    resources :predictions, only: [:index]
  end

  resources :blurbs, :path => :words, only: [:show, :create, :destroy, :update] do
    get :update_background
  end
  get '/my_predictions' => 'blurbs#index', :as => 'my_blurbs'

  root to: redirect('/words')
  get '/words' => 'application#home', :as => 'home'

  get 'user_home' => redirect('/my_predictions'), :as => 'user_root'

  get 'worldcup' => 'worldcup#root'
end
