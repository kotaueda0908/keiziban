Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
    get "posts/index" => "posts#index"
    get "posts/new" => "posts#new"
    post "posts" => "posts#create"
    get 'posts/:id/edit', to: 'posts#edit'
    delete 'posts/:id/destroy', to: 'posts#destroy'
    patch 'posts/:id', to: 'posts#update'
    get 'posts/:id', to: 'posts#show'
    get '*path', controller: 'application', action: 'render_404'
    root 'home#index' 
    get 'home/index'
end
