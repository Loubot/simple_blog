SimpleBlog::Application.routes.draw do
  
  get "category/new"

  get "category/update"

  get "category/destroy"

  resources :posts


  get "staff/index"

  get "staff/menu"

  get "staff/login"

  get "staff/logout"

  get "main/index"

  get "main/list"

  get "main/category"

  get "main/archive"

  get "main/view_post"

  root :to => 'posts#index'

end
