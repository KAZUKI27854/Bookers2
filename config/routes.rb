Rails.application.routes.draw do
  get 'chats/show'
  devise_for :users, controllers: {
  registrations: "users/registrations"
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/home/about' => 'homes#about'
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  get 'users/:id/followers_index' => 'users#followers_index', as: 'followers'
  get 'users/:id/followed_index' => 'users#followed_index', as: 'followed'
  get '/search' => 'searchs#search'
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
  resources :relationships, only: [:create, :destroy]
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end
