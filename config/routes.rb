Rails.application.routes.draw do
  resources :song_chords
  resources :song_keys
  resources :songs
  resources :scale_chord_progressions
  resources :scale_chords
  resources :key_scales
  resources :chord_progression_chords
  resources :key_notes
  resources :chord_notes
  resources :scale_notes
  resources :keys
  resources :scales
  resources :chords
  resources :notes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/keys/:type/:name', to: 'keys#show'
  post '/songs/new', to: 'songs#create'
end
