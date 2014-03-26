Markmy::Application.routes.draw do
  devise_for :users, :controllers => { registrations: :registrations, sessions: :sessions }
  resources :blurbs, :path => :words, only: [:show, :create, :destroy, :update]
  get '/words' => 'application#home', :as => 'home'
  get '/blurbs/new' => 'application#home', as: :new_blurb
  get 'my_blurbs' => 'blurbs#index', :as => 'my_blurbs'
  get 'user_home' => redirect('/my_blurbs'), :as => 'user_root'
  root to: redirect('/words')
end
