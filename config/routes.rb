Rails.application.routes.draw do
  get '/mypage' => 'mypage#show'
  get 'search' => 'articles#search'
  root :to => 'articles#index'
  devise_for :users
  resources :articles
end
