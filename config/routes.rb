Rails.application.routes.draw do
  get '/',                       to: 'home#top'
  get 'about',                   to: 'home#about'
  get 'signup',                  to: 'users#new'
  resources :users
  resources :posts
end
