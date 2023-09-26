Rails.application.routes.draw do
  get 'searches/search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to => "homes#top"
  get 'home/about' => 'homes#about', as: 'about'

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    get "search", to: "books#search"
  end
  
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy, :following_users, :followed_users]
    get 'relationships/following' => 'relationships#following', as: 'following'
    get 'relationships/followed' => 'relationships#followed', as: 'followed'
    get "search" => "users#search"
  end
  get "searches/search" => "searches#search", as: "search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end