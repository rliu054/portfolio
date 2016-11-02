Rails.application.routes.draw do
  devise_for :users
  resources :projects
  resources :posts

  # resources :posts do
  #   resources :comments
  # end

  root 'welcome#index'
  get 'welcome/index'
  get 'contact', to: 'contact#index'

  get '*path' => redirect('/')
end
