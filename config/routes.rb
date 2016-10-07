Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end

  root 'welcome#index'
  get 'welcome/index'
end
