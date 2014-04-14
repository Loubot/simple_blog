SimpleBlog::Application.routes.draw do
  
  get 'category/index'

  post "category/new"

  post "/category/update:id", to: 'category#update', as:'category'

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

  root :to => 'posts#index'

end
