Rails.application.routes.draw do
  resources :goods do
    collection { post :import }
  end

  root to: 'goods#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
