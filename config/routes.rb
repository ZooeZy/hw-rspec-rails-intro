Rottenpotatoes::Application.routes.draw do

  get '/search', to: 'movies#search_tmdb', as: :search_tmdb

  post '/search/add', to: 'movies#add_movie', as: :add_movie

  resources :movies

  root to: redirect('/movies')

end