Markmy::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :blurbs, :path => :words, only: [:show, :create, :destroy]
  get '/words' => 'application#home', :as => ['home', :new_blurb]
  get 'my_words' => 'blurbs#index', :as => 'my_blurbs'
  root to: redirect('/words')

end
