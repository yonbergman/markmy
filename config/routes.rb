Markmy::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :blurbs, :path => :words, only: [:show, :create, :destroy]
  get '/words' => 'application#home', :as => 'home'
  get '/blurbs/new' => 'application#home', as: :new_blurb
  get 'my_blurbs' => 'blurbs#index', :as => 'my_blurbs'
  root to: redirect('/words')
end
