Rails.application.routes.draw do
  get '/mypage' => 'mypage#show'
  root :to => 'articles#index'
  devise_for :users
  resources :sample_articles
  resources :articles
end
