Rails.application.routes.draw do
  get 'goods/index'
  get 'goods/import'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
