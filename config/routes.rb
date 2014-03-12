Markmy::Application.routes.draw do
  resources :blurbs, :path => :words, only: [:show, :new, :create, :destroy]
  get '/words' => 'application#home'
  root to: redirect('/words')

end
