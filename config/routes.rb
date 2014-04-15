SimpleBlog::Application.routes.draw do
  
  get 'category/index'

  post 'category/index'

  put '/category/edit'

  post 'category', to: 'category#create'

  match 'categories', to: 'category#create'

  get "/category/edit", to: 'category#edit'

  delete "category/destroy:id", to: 'category#destroy', as: 'category'

  get "staff/index"

  get "staff/menu"

  get "staff/login"

  get "staff/logout"

  get "main/index"

  get "main/list"

  get "main/category"

  get "main/archive"

  get "main/view_post"

  resources :posts

  resources :users

  root :to => 'posts#index'

end
