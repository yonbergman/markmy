Markmy::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :blurbs, :path => :words, only: [:show, :new, :create, :destroy]
  get '/words' => 'application#home'
  get 'my_words' => 'blurbs#index', :as => 'my_blurbs'
  root to: redirect('/words')

end
