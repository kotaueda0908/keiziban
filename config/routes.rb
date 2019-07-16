Rails.application.routes.draw do

  devise_for :users
    get 'home/index'
    get 'posts/new', to: 'posts#new'
    post "posts" => "posts#create"
    get 'posts/:id/edit', to: 'posts#edit'
    delete 'posts/:id/destroy', to: 'posts#destroy'
    patch 'posts/:id', to: 'posts#update'
    get 'posts/:id', to: 'posts#show'
    root 'home#index'
    get 'home/index'
    root 'posts#index'
    resources :posts do
      resources :comments, only: [:create, :destroy]
    end
end
