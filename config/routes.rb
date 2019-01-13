Rails.application.routes.draw do
  get    '/',                       to: 'home#top'
  get    'about',                   to: 'home#about'
  get    'signup',                  to: 'users#new'
  get    '/login',                  to: 'sessions#new'
  post   '/login',                  to: 'sessions#create'
  delete '/logout',                 to: 'sessions#destroy'
  get    'messages/index',          to: 'messages#index'
  get    'messages/show/:id',       to: 'messages#show'
  resources :users
  resources :posts
end
