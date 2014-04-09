SimpleBlog::Application.routes.draw do
  
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

  root :to => 'main#index'

end
