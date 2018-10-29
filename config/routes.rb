Rails.application.routes.draw do
  devise_for :users
  root 'blog_posts#index
  '
  get '/blog_posts' => 'blog_posts#index'

  get '/blog_posts/new' => 'blog_posts#new'
  
  post '/blog_posts' => 'blog_posts#create' 
  get '/blog_posts/:id' => 'blog_posts#show'
  get '/blog_posts/:id/edit' => 'blog_posts#edit'
  put '/blog_posts/:id' => 'blog_posts#update'
  delete '/blog_posts/:id' => 'blog_posts#destroy'
  get '/comments' => 'comments#index'
  post '/comments' => 'comments#create'
  delete '/comments/:id' => 'comments#destroy'
end
