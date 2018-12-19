Rails.application.routes.draw do
  get '/',                       to: 'home#top'
  get 'about',                   to: 'home#about'
  resources :users
  resources :posts
end
