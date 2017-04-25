Rails.application.routes.draw do
  resources :messages
  resources :users
  
  #tmp
  get '/friends', to: 'users#show_friend'
end
