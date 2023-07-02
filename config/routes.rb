Rails.application.routes.draw do
  get "search" => "searches#search"
  get 'relationships/followings'
  get 'relationships/followers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
  resources :chats, only:[:show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

# book_favorites DELETE /books/:book_id/favorites(.:format)     favorites#destroy
#                POST   /books/:book_id/favorites(.:format)     favorites#create