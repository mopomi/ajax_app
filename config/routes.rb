Rails.application.routes.draw do
  get 'keijiban', to: 'posts#index'
  get 'keijiban/new', to: 'posts#new'
  post 'keijiban', to: 'posts#create'
end