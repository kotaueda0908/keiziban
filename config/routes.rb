Rails.application.routes.draw do
    get "posts/index" => "posts#index"
    get "posts/new" => "posts#new"
    post "posts" => "posts#create"
    get 'posts/:id/edit', to: 'posts#edit'
    delete 'posts/:id/destroy', to: 'posts#destroy'
    patch 'posts/:id', to: 'posts#update'
    get 'posts/:id', to: 'posts#show'
    get '*not_found' => 'application#routing_error'
    post '*not_found' => 'application#routing_error'
end
