DataHub::Engine.routes.draw do
  resources :models
  root to: 'models#index'
end
