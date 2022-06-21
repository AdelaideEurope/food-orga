Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :ingredients
  resources :recipes do
    post 'add_to_latest_menu', to: 'recipes#add_to_latest_menu'
  end
  resources :menus
end
