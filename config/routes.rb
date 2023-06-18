Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, only:[:index, :create, :show, :destroy] do
    resources :comments, only: [:index, :create]
  end
end
